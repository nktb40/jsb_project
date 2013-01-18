# coding: utf-8
class UserMailer < ActionMailer::Base
  default from: "nktb40@gmail.com"
  
  def order_email(order, user)
    @user = user
    @order = order
    @cartitems = @user.orders.find(@order.id).cart_items.where(:item_type=>"order")    
    @url  = "http://jsb-bracelets.com"
    mail(:to => "nktb40@gmail.com", :subject => "Заказ #"+@order.id.to_s+" в магазине Julia Bracelets")
  end
end
