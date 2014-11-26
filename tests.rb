#IGNORE THIS FILE - this contains testing code content
# load 'ar.rb'
#
# new_log_entry = LogEntry.new
#
# new_log_entry.client_ip = '74.216.41.92'
# new_log_entry.client_identd = '-'
# new_log_entry.client_userid = '-'
# new_log_entry.server_time = '19/Nov/2012:08:11:09 -0600'
# new_log_entry.client_request = 'GET /spinabifida/modules/mod_ppc_simple_spotlight/img/button/prev1.png HTTP/1.1'
# new_log_entry.status_code = 304
# new_log_entry.size_returned = 188
# new_log_entry.referrer = 'http://bitaction01.academic.rrc.ca/spinabifida/index.php'
# new_log_entry.client_user_agent = 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.4; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; BRI/2; OfficeLiveConnector.1.5; OfficeLivePatch.1.3)'
#
# new_log_entry.save
# puts new_log_entry.inspect
#
# new_log_entry.errors.messages.each do |column,errors|
#   errors.each do |error|
#     puts "#{column} is invalid because #{error}"
#   end
# end

################################

# count = 0
#
# File.open("access_short.log", "r") do |f|
#   f.each_line do |line|
#     count = count + 1
#     puts line
#     my_string_array = line.sub('[','"').sub(']','"').scan(/"[^"]+"|\S+/).map { |word| word.delete('"') }
#     puts my_string_array.inspect
#     puts my_string_array.count
#   end
# end
#
# puts count

################################

# load 'ar.rb'
# #LogFormat "%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-agent}i\"" combined
# # class LogEntry
# #   def initialize (client_ip, client_identd, client_userid, server_time, client_request, status_code, size_returned, referrer, client_user_agent)
# #     @client_ip = client_ip
# #     @client_identd = client_identd
# #     @client_userid = client_userid
# #     @server_time = server_time
# #     @client_request = client_request
# #     @status_code = status_code
# #     @size_returned = size_returned
# #     @referrer = referrer
# #     @client_user_agent = client_user_agent
# #   end
# #
# #   def to_s
# #     "Client IP/Host (%h): #{@client_ip}\n" +
# #     "Client identd (%l): #{@client_identd}\n" +
# #     "Client userid (%u): #{@client_userid}\n" +
# #     "Time server processed request (%t): #{@server_time}\n" +
# #     "Client HTTP Verb Request ('\"%r\"'): #{@client_request}\n" +
# #     "Status Code returned by server (%>s): #{@status_code}\n" +
# #     "Size of object returned by server (%b): #{@size_returned}\n" +
# #     "Referrer HTTP request ('\"%{Referer}i\"'): #{@referrer}\n" +
# #     "Client User-Agent (browser) ('\"%{User-agent}i\"'): #{@client_user_agent}\n\n"
# #   end
# #
# # end
# #count = 0
# access_log_entry_array = Array.new
# #access_log_objects_array = Array.new
#
# File.open("access_short.log", "r") do |f|
#   f.each_line do |line|
#     #count = count + 1
#     #puts line
#     my_string_array = line.scan(/"[^"]+"|\[[^\[\]]+\]|\S+/).map { |word| word.delete('"') }
#     #puts my_string_array.inspect
#     #puts my_string_array.count
#     access_log_entry_array << my_string_array
#   end
# end
#
# #puts access_log_entry_array.count
#
# access_log_entry_array.each do |singleLogEntry|
#
#   if singleLogEntry.count == 9
#
#     new_log_entry = LogEntry.new
#     new_log_entry.client_ip = singleLogEntry[0]
#     new_log_entry.client_identd = singleLogEntry[1]
#     new_log_entry.client_userid = singleLogEntry[2]
#     new_log_entry.server_time = singleLogEntry[3]
#     new_log_entry.client_request = singleLogEntry[4]
#     new_log_entry.status_code = singleLogEntry[5].to_i
#     new_log_entry.size_returned = singleLogEntry[6].to_i
#     new_log_entry.referrer = singleLogEntry[7]
#     new_log_entry.client_user_agent = singleLogEntry[8]
#
#     if new_log_entry.save
#       puts new_log_entry.inspect
#     else
#       puts "There was an error saving line #{access_log_entry_array.count+1} to the database."
#       new_log_entry.errors.messages.each do |column,errors|
#         errors.each do |error|
#           puts "#{column} is invalid because #{error}"
#         end
#       end
#     end
#     #access_log_objects_array << LogEntry.new(singleLogEntry[0], singleLogEntry[1], singleLogEntry[2], singleLogEntry[3], singleLogEntry[4], singleLogEntry[5].to_i, singleLogEntry[6].to_i, singleLogEntry[7], singleLogEntry[8])
#
#   end
#
# end
#
# #access_log_objects_array.each { |log_entry| puts log_entry }
# #puts count

