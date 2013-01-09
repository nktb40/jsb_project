class CartItem < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  attr_accessible :user_id, :product_id, :quantity, :item_type

end
