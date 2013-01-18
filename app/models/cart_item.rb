class CartItem < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  belongs_to :order
  attr_accessible :user_id, :product_id, :quantity, :item_type
end
