# coding: utf-8
class CartsController < ApplicationController
  helper_method :sum_up
  def index
  end

  def show
    @user = current_or_guest_user
  	 @cartitems = @user.cart_items.where(:item_type=>"cart")
  end
  
  def add
  	@user = current_or_guest_user
   @cartitem = @user.cart_items.new
   @cartitem.item_type = "cart"
   @product = Product.find(params[:product_id])
   if @product
      @items = @user.cart_items.where(:item_type=>"cart", :product_id => @product.id)
      if @items.empty?
   	@cartitem.product_id = @product.id
   	@cartitem.quantity = 1
   	else
   	@cartitem = @items[0]
   	@cartitem.quantity += 1
   	end
   	if @cartitem.save
   	redirect_to :back, notice: 'Product was successfully added to your cart.'
		end   
   else
   redirect_to :back, notice: 'Product was not added'
   	
   end
  end
  
  def sum_up
  	 @user = current_or_guest_user
  	 @items = @user.cart_items.where(:item_type=>"cart")
  	 @sum = 0
  	 @items.each do |item|
  	 	@sum += (Product.find(item.product_id).price * item.quantity)
  	 end	
  	 @sum
  end
  
  def recalculate
   @user = current_or_guest_user
   @result = @user.update_attributes(params[:user])
   puts "-----------"
   puts @user.errors.inspect
  	redirect_to cart_url					
  end

end
