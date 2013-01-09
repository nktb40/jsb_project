class OrderItem < ActiveRecord::Base
  belongs_to :order
  has_many :products
  attr_accessible :product_id, :quantity
end
