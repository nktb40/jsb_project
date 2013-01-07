class Admin::ProductsController < ApplicationController
	layout "admin"

  before_filter :authorize, :except => :index
  def index
    @products = Product.all

  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(params[:product])
      if @product.save
        redirect_to admin_products_path(params[:id]), notice: 'Product was successfully created.'
        
      else
        render action: "new" 
      end
  end

  def update
    @product = Product.find(params[:id])

      if @product.update_attributes(params[:product])
        redirect_to admin_products_path, notice: 'Product was successfully updated.'
      else
        render action: "edit"
      end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admin_products_url
  end
  
  def destroy_multiple
    Product.destroy(params[:product_ids])
    redirect_to admin_products_url
  end
end
