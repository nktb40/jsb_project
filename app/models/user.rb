class User < ActiveRecord::Base

  has_many :orders
  has_many :cart_items, :dependent => :destroy
  has_many :products, :through => :cart_items
  accepts_nested_attributes_for :cart_items 
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :cart_items_attributes, :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
end
