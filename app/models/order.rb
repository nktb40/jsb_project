class Order < ActiveRecord::Base
  attr_accessible :product_id, :quantity, :user_id
end
