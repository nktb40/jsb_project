# coding: utf-8
class OrdersController < ApplicationController
before_filter :filter_current_user, :only => [:index, :show]


def filter_current_user
	unless current_or_guest_user
    flash[:error] = "unauthorized access"
    redirect_to root_path
    false
  end
end


  def index
    @user = current_or_guest_user
    @orders = @user.orders.page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])
    @user = current_or_guest_user
	 @cartitems = @user.orders.find(@order.id).cart_items.where(:item_type=>"order")    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
    @order = Order.new

    respond_to do |format|
      format.html  #new.html.erb
      format.json { render json: @order }
    end
  end


  def create
    @order = Order.new(params[:order])
	 @user = current_or_guest_user
	 @order.user_id = @user.id
	 @order.status = "processing"
	 @order.delivering_method = "courier"
	 
    respond_to do |format|
      if @order.save
         @items = @user.cart_items.where(:item_type=>"cart")
	  	   @items.each do |item|
	  	      item.item_type = "order"
	  	      item.order_id = @order.id
	  	      item.save
	  	   end
	  	UserMailer.order_email(@order, @user).deliver
      format.html { redirect_to @order, notice: 'Ваш заказ принят.' }
      format.json { render json: @order, status: :created, location: @order }  
      else
        format.html { render action: "new" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end
  
end
