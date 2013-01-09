class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  attr_accessible :product_id, :quantity
end
