class LogEntry < ActiveRecord::Base
  validates :client_ip, :client_identd, :client_userid, :server_time,
            :client_request, :status_code, :size_returned, :referrer, :client_user_agent, :presence => true
  validates :status_code, :size_returned, :numericality => true
end