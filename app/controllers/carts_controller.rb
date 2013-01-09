class CartsController < ApplicationController
  helper_method :sum_up
  def index
  end

  def show
    @user = current_or_guest_user
  	 @cartitems = @user.cart_items
  end
  
  def add
  	@user = current_or_guest_user
   @cartitem = @user.cart_items.new

   @product = Product.find(params[:product_id])
   if @product
      @items = @user.cart_items.where(:product_id => @product.id)
      if @items.empty?
   	@cartitem.product_id = @product.id
   	@cartitem.quantity = 1
   	@cartitem.save
   	else
   	@cartitem = @items[0]
   	@cartitem.quantity += 1
   	@cartitem.save
   	end
   	redirect_to @product, notice: 'Product was successfully added to your cart.'
   else
   redirect_to @product, notice: 'Product was not added'
   	
   end
  end
  
  def sum_up
  	 @user = current_or_guest_user
  	 @items = @user.cart_items.all
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
