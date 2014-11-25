load 'ar.rb'

#create 1st product
new_product = Product.new

new_product.name = "Coffee"
new_product.description = "Bag of Columbian coffee beans"
new_product.price = "13.99"
new_product.stock_quantity = "10"

#save the product to the database and view it
new_product.save
puts new_product.inspect


#create 2nd product
second_new_product = Product.new( :name             =>  "Apple",
                                  :description     =>  "Bag of Apples",
                                  :price           =>  "9.80",
                                  :stock_quantity  =>  "5")

#save the product to the database and view it
second_new_product.save
puts second_new_product.inspect


third_new_product = Product.create( :name            => "Grapefruit",
                                    :description     =>  "Florida Grapefruit",
                                    :price           =>  "0.99",
                                    :stock_quantity  =>  "20")

puts third_new_product.inspect

invalid_product = Product.create( :name            => "Grapefruit",
                                  :price           =>  "0.99" )

invalid_product.errors.messages.each do |column,errors|
  errors.each do |error|
    puts "#{column} is invalid because #{error}"
  end
end
