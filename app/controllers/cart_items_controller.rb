class CartItemsController < ApplicationController


  def create
    @cart_item = CartItem.new(params[:cart_item])

    respond_to do |format|
      if @cart_item.save
        format.html { redirect_to @cart_item, notice: 'Cart item was successfully created.' }
        format.json { render json: @cart_item, status: :created, location: @cart_item }
      else
        format.html { render action: "new" }
        format.json { render json: @cart_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])

    respond_to do |format|
      if @cart_item.update(params[:cart_items])
        format.html { redirect_to @cart_item, notice: 'Cart item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cart_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_multiple
  	 @cartitems = CartItem.update(params[:cart_items].keys, params[:cart_items].values).reject { |p| p.errors.empty? }
	  if @cartitems.empty?
	    redirect_to cart_path
	  else
	    redirect_to cart_path
     end
  end
  
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to :back
  end
end
