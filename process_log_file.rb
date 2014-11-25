load 'ar.rb'

new_log_entry = LogEntry.new

new_log_entry.client_ip = '74.216.41.92'
new_log_entry.client_identd = '-'
new_log_entry.client_userid = '-'
new_log_entry.server_time = '19/Nov/2012:08:11:09 -0600'
new_log_entry.client_request = 'GET /spinabifida/modules/mod_ppc_simple_spotlight/img/button/prev1.png HTTP/1.1'
new_log_entry.status_code = 304
new_log_entry.size_returned = 188
new_log_entry.referrer = 'http://bitaction01.academic.rrc.ca/spinabifida/index.php'
new_log_entry.client_user_agent = 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.4; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; BRI/2; OfficeLiveConnector.1.5; OfficeLivePatch.1.3)'

new_log_entry.save
puts new_log_entry.inspect

new_log_entry.errors.messages.each do |column,errors|
  errors.each do |error|
    puts "#{column} is invalid because #{error}"
  end
end