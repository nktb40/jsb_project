class Admin::OrdersController < ApplicationController
  layout "admin"
  before_filter :authenticate_admin! # Tell devise to use :admin map
  # GET /admin/orders
  # GET /admin/orders.json
  def index
    @admin_orders = Order.page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admin_orders }
    end
  end

  # GET /admin/orders/1
  # GET /admin/orders/1.json
  def show
    @order = Order.find(params[:id])
	 @items = CartItem.where(:order_id=>@order.id)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin_order }
    end
  end

  # GET /admin/orders/new
  # GET /admin/orders/new.json
  def new
    @admin_order = Order.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_order }
    end
  end

  # GET /admin/orders/1/edit
  def edit
    @admin_order = Order.find(params[:id])
  end

  # POST /admin/orders
  # POST /admin/orders.json
  def create
    @admin_order = Order.new(params[:admin_order])

    respond_to do |format|
      if @admin_order.save
        format.html { redirect_to @admin_order, notice: 'Order was successfully created.' }
        format.json { render json: @admin_order, status: :created, location: @admin_order }
      else
        format.html { render action: "new" }
        format.json { render json: @admin_order.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @admin_order = Order.find(params[:id])

    respond_to do |format|
      if @admin_order.update_attributes(params[:order])
        format.html { redirect_to [:admin, @admin_order], notice: 'Order was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @admin_order = Order.find(params[:id])
    @admin_order.destroy

    respond_to do |format|
      format.html { redirect_to admin_orders_url }
      format.json { head :no_content }
    end
  end
end
