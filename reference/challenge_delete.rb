load 'ar.rb'

apple_product = Product.where(:name => 'Apple').first

puts apple_product.inspect

apple_product.destroy unless apple_product.nil?

puts apple_product.inspect