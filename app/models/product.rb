class Product < ActiveRecord::Base
  has_many :order_items
  has_many :cart_items
  attr_accessible :description, :image, :name, :price, :product_code, :product_status, :image
  mount_uploader :image, ImageUploader  
end
