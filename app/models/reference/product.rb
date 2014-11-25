class Product < ActiveRecord::Base
  validates :name, :description, :price, :stock_quantity, :presence => true
  validates :name, :uniqueness => true
end