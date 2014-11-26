#connect to the database and create the table if it doesn't exist
load 'ar.rb'

access_log_entry_array = Array.new

#Open the log file access_one.log and process through it line by line
#Retrieve each piece of the every log entry in the file as denoted by a space delimeter unless the space
#occurs within quotes or square brackets
#store the the pieces of a single log entry in an array and store all of those arrays into another array
#which will contain all of the log entries for the entire file
File.open("access_one.log", "r") do |f|
  f.each_line do |line|
    my_string_array = line.scan(/"[^"]+"|\[[^\[\]]+\]|\S+/).map { |word| word.delete('"') }
    access_log_entry_array << my_string_array
  end
end

#loop through each log entry
access_log_entry_array.each do |singleLogEntry|

  #each individual log entry should have 9 pieces if it is in the correct apache combined log format
  if singleLogEntry.count == 9

    #create a LogEntry object containing 9 properties (1 for each apache log file field)
    new_log_entry = LogEntry.new
    new_log_entry.client_ip = singleLogEntry[0]
    new_log_entry.client_identd = singleLogEntry[1]
    new_log_entry.client_userid = singleLogEntry[2]
    new_log_entry.server_time = singleLogEntry[3]
    new_log_entry.client_request = singleLogEntry[4]
    new_log_entry.status_code = singleLogEntry[5].to_i
    new_log_entry.size_returned = singleLogEntry[6].to_i
    new_log_entry.referrer = singleLogEntry[7]
    new_log_entry.client_user_agent = singleLogEntry[8]

    #try to save the log entry to the database
    if new_log_entry.save
      #if the save succeeds output the contents of the log entry object
      puts new_log_entry.inspect
    else
      #if the save fails output an error message and a message describing why it did not save
      puts "There was an error saving line #{access_log_entry_array.count+1} to the database."
      new_log_entry.errors.messages.each do |column,errors|
        errors.each do |error|
          puts "#{column} is invalid because #{error}"
        end
      end
    end

  end

end
