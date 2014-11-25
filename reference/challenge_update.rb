load 'ar.rb'

products_stock_over_40 = Product.where("stock_quantity > 40")

products_stock_over_40.each do |product|
  puts "Name: #{product.name} Stock: #{product.stock_quantity}"
  
  product.stock_quantity = product.stock_quantity + 1
  
  puts "Name: #{product.name} Stock: #{product.stock_quantity}"
  
  if (product.save)
    puts "The product was updated."
  else
    puts "There was a validation error when saving the product."
  end
  
  puts
end