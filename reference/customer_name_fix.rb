#WEBD-2000 Electronic Commerce
#Assignment 2- Ruby Programming
#Clayton Wallace
#October 8, 2013

#customer_name_fix.rb:  Script to update the customer database to modify the customer name
#                       to be stored in a first_name and last_name field rather than all
#                       in one field

#load the database and models
load 'ar.rb'

#get objects for all customers in the database
customers = Customer.all

#loop through each customer separating their first and last name based on the
#first space found and store the first name and last name in their appropriate fields
#in the database
customers.each do |customer|
  #get the customers full name which used to be stored in the first_name field
  full_name = customer.first_name

  #get the part of the customer name before the space as first name
  surname = full_name.split[0]

  #get the part of the customer name after the space as last name
  given_name = full_name.split[1]

  #update the customer record
  customer.first_name = surname
  customer.last_name = given_name

  #push the changes to the database, if it fails display an error
  if (!customer.save) then
    puts "There was an error saving to the database for #{full_name}"
  end
end