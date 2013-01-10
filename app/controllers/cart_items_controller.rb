class CartItemsController < ApplicationController

  before_filter :filter_current_user, :only => [:update, :destroy]

  def filter_current_user
		unless current_user
	    flash[:error] = "unauthorized access"
	    redirect_to root_path
	    false
	  end
  end
	 
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
      if @cart_item.update_attributes(params[:cart_item])
        format.html { redirect_to @cart_item, notice: 'Cart item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cart_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to :back
  end
end
