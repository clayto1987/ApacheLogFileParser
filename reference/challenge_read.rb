load 'ar.rb'

single_product = Product.first
puts single_product.inspect
puts

#Products table column
#id, name, description, price, stock_quantity, category_id, created_at, updated_at
#Products has a relationship with Categories table because it has a category_id column
#which will be a foregin key referencing the Categories table
category_for_single_product = Category.find(1)
puts "The category for product 1 is: #{category_for_single_product.name}, verifying a relationship with categories table"
puts

number_of_products = Product.count
puts "There are #{number_of_products} products"
puts

c_products_above_10 = Product.where("price > 10").where("name LIKE 'c%'")
              
puts "The products with a price > $10 and starting with c are:"
c_products_above_10.each do |product|
  puts product.name
end
puts

low_stock_product = Product.where("stock_quantity < 5")
puts "There are #{low_stock_product.size} products that are low in stock (< 5)"
puts


customer_one = Customer.first

puts customer_one.inspect

customer_one_province = customer_one.province.name

puts "#{customer_one.name} is based out of #{customer_one_province} province"