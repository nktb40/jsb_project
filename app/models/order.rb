class Order < ActiveRecord::Base
  belongs_to :user
  has_many :cart_items
  attr_accessible :user_id, :customer_name,
   :email, :adress, :phone, :comments, :status, :delivering_method
end
