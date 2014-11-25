#WEBD-2000 Electronic Commerce
#Assignment 2- Ruby Programming
#Clayton Wallace
#October 8, 2013

#generate_customer_invoices.rb: Script to process all orders made by customers of the business
#                               and create an invoice, indicating customer information, products purchased
#                               quantity and unit cost of products purchased and totals for each individual item
#                               Also specifies the order total for each customer, how much they owe in provincial and
#                               government taxes and their total after taxes

load 'ar.rb'

#function to format numbers as currency
def currency amount
  sprintf("$%.2f",amount)
end

#get all customers with new orders
customers_with_orders = Customer.includes('orders').where('orders.id IS NOT NULL').where('orders.status = "new"')

#Create an invoice for each customer
customers_with_orders.each do |customer|

  #Output invoice header containing customer info
  puts "Invoice for #{customer[:first_name]} #{customer[:last_name]}"
  puts "#{customer[:address]}"
  puts "#{customer[:city]}, #{customer.province.name}"

  puts

  #Cycle through each order the customer placed
  customer.orders.each_with_index do |order, index|
    sub_total = 0.0

    puts "Order #{index+1}"

    #Cycle through each line_item/product the customer ordered
    order.line_items.each do |line_item|

      product_name = line_item.product.name

      #display the name of the product the customer ordered
      print "#{product_name} "

      #determine number of filler space required based on length of product name string to keep formatting aligned
      (60 - product_name.length).times {
        print "."
      }

      #determine/accumulate product and cost info relating to the order
      quantity = line_item[:quantity]
      unit_price = line_item[:price]
      item_total = quantity * unit_price
      sub_total += item_total

      #display the number of item ordered, unit cost each and total cost for each item
      print " #{quantity} x #{currency unit_price} = #{currency item_total}\n"
    end

    puts

    #determine pst, gst, hst rates
    pst_rate =  order[:pst_rate]
    gst_rate = order[:gst_rate]
    hst_rate = order[:hst_rate]

    #determine total taxes for the order and the customers total after taxes
    order_pst = (sub_total * pst_rate).round(2)
    order_gst = (sub_total * gst_rate).round(2)
    order_hst = (sub_total * hst_rate).round(2)
    grand_total = sub_total + order_gst + order_hst + order_pst

    #generate invoice footer containing the customer billing - before and after taxes
    puts "Sub Total\t: #{currency sub_total}"

    #display the tax for the order based on which taxes the customers province requires
    puts "PST (#{(pst_rate * 100).round(2)}%)\t: #{currency order_pst}" if pst_rate > 0
    puts "GST (#{(gst_rate * 100).round(2)}%)\t: #{currency order_gst}" if gst_rate > 0
    puts "HST (#{(hst_rate * 100).round(2)}%)\t: #{currency order_hst}" if hst_rate > 0

    #display the grand total for the order
    puts "Grand Total\t: #{currency grand_total}"

    puts
  end

  puts "************************************************************************************"
  puts

end