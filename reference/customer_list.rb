#WEBD-2000 Electronic Commerce
#Assignment 2- Ruby Programming
#Clayton Wallace
#October 8, 2013

#customer_list.rb:  Script to display the names, email addresses and street addresses
#                   for 10 customers

# The ar.rb file loads all of our ActiveRecord Object and
# establishes our database connection.
load 'ar.rb'

# Load up ten customers and display their details.
customers = Customer.limit(10)

# Loop through these customers displaying their names, email
# addresses, mailing address and city.
customers.each do |customer|
  puts "Name: #{customer.first_name} #{customer.last_name}"
  puts "Email: #{customer.email}"
  puts "Address: #{customer.address}, #{customer.city}"
  puts
end

#products = Product.all
#
#products.each do |product_a|
#  puts product_a.inspect
#end
#
#orders = Order.all
#
#puts orders.size