load 'ar.rb'

access_log_entry_array = Array.new

File.open("access_one.log", "r") do |f|
  f.each_line do |line|
    my_string_array = line.scan(/"[^"]+"|\[[^\[\]]+\]|\S+/).map { |word| word.delete('"') }
    access_log_entry_array << my_string_array
  end
end

access_log_entry_array.each do |singleLogEntry|

  if singleLogEntry.count == 9

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

    if new_log_entry.save
      puts new_log_entry.inspect
    else
      puts "There was an error saving line #{access_log_entry_array.count+1} to the database."
      new_log_entry.errors.messages.each do |column,errors|
        errors.each do |error|
          puts "#{column} is invalid because #{error}"
        end
      end
    end

  end

end
