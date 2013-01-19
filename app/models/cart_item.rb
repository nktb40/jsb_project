class CartItem < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  belongs_to :order
  attr_accessible :user_id, :product_id, :quantity, :item_type
  accepts_nested_attributes_for :product
end
