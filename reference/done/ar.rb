# Load the required gems/libraries.
require 'active_record'
require 'logger'

# Load all of our ActiveRecord::Base objects.
load 'models/category.rb'
load 'models/customer.rb'
load 'models/product.rb'
load 'models/province.rb'
#load 'models/ghost.rb'

# Establish our connection to our serverless sqlite3 database.
ActiveRecord::Base.establish_connection :adapter => 'sqlite3', :database => 'db/development.sqlite3'

# For debugging purposes, uncomment this line to see the SQL generated by ActiveRecord:
#ActiveRecord::Base.logger = Logger.new(STDOUT)

# Uncomment this line to make the logger output look nicer in Windows.
#ActiveSupport::LogSubscriber.colorize_logging = false