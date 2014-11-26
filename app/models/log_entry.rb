#Class for a single entry in the log file
#Validates that all 9 fields required by the Apache combined log format are present (even if they have no data)
#Ensures the status code and size are numbers
class LogEntry < ActiveRecord::Base
  validates :client_ip, :client_identd, :client_userid, :server_time,
            :client_request, :status_code, :size_returned, :referrer, :client_user_agent, :presence => true
  validates :status_code, :size_returned, :numericality => true
end