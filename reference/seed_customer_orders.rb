#WEBD-2000 Electronic Commerce
#Assignment 2- Ruby Programming
#Clayton Wallace
#October 8, 2013

#seed_customer_orders.rb: Script to create new order for customers
#                         Requires you provide a customer number, product numbers and quantities of products
#                         ordered and will then create a new order record with all required data including foreign key
#                         references, it will also create new line_items for the order based on the products specified
#                         including foreign key references to products and orders tables

#connect to the database and load the models
load 'ar.rb'

#creates an order record for a specified customer containing specified
#products and quantities
def create_order (customer_number, current_order_products)

  #retrieve the customer specified
  customer = Customer.where(:id => customer_number)[0]

  puts customer.inspect

  #create an order for that customer, setting the customer_id field
  order = customer.orders.build

  #set the status and tax rates for the order based on the customer's province
  order.status = 'new'
  order.pst_rate = customer.province.pst
  order.gst_rate = customer.province.gst
  order.hst_rate = customer.province.hst

  #save the order
  order.save

  puts order.inspect

    #loop through each product/quantity pair specified as part of the order
    current_order_products.each do |product_details|

      #get the current product specified from the database
      single_product = Product.where(:id => product_details[:product_id])[0]

      #create a line_item record for the product, including a product_id
      #set the product, price and quantity for the line item
      single_line_item = order.line_items.build
      single_line_item.product = single_product
      single_line_item.price = single_product.price
      single_line_item.quantity = product_details[:quantity]

      #save the line item to the database
      single_line_item.save

      puts single_line_item.inspect

    end

    puts

end

# ORDER 1
#specify customer number and products/quantities for each order
customer_number = 3819
current_order_products = [
                            { :product_id => 175, :quantity => 2 },
                            { :product_id => 161, :quantity => 8 },
                            { :product_id => 197, :quantity => 14 },
                            { :product_id => 205, :quantity => 15 }
                          ]

#create order record for the customer containing the products @ quantities specified
create_order(customer_number, current_order_products)

# ORDER 2
#specify customer number and products/quantities for each order
customer_number = 1609
current_order_products = [
                            { :product_id => 224, :quantity => 12 },
                            { :product_id => 173, :quantity => 6 },
                            { :product_id => 219, :quantity => 10 },
                            { :product_id => 174, :quantity => 4 }
                          ]

#create order record for the customer containing the products @ quantities specified
create_order(customer_number, current_order_products)

# ORDER 3
#specify customer number and products/quantities for each order
customer_number = 8132
current_order_products = [
                            { :product_id => 194, :quantity => 9 },
                            { :product_id => 195, :quantity => 3 },
                            { :product_id => 212, :quantity => 7 },
                            { :product_id => 160, :quantity => 5 }
                          ]

#create order record for the customer containing the products @ quantities specified
create_order(customer_number, current_order_products)

# ORDER 4 - new order for customer that already had an order
#specify customer number and products/quantities for each order
customer_number = 498
current_order_products = [
                            { :product_id => 188, :quantity => 20 },
                            { :product_id => 189, :quantity => 11 },
                            { :product_id => 221, :quantity => 13 },
                            { :product_id => 158, :quantity => 1 }
                          ]

#create order record for the customer containing the products @ quantities specified
create_order(customer_number, current_order_products)

# ORDER 5 - new order for customer that has an order already
#specify customer number and products/quantities for each order
customer_number = 3819
current_order_products =  [
                            { :product_id => 163, :quantity => 2 },
                            { :product_id => 164, :quantity => 2 },
                            { :product_id => 165, :quantity => 2 },
                            { :product_id => 166, :quantity => 2 }
                          ]

#create order record for the customer containing the products @ quantities specified
create_order(customer_number, current_order_products)