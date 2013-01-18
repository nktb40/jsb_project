class ProductsController < ApplicationController
  # GET /products
  # GET /products.json
  
  
  def index
    @products = Product.page(params[:page]).per(3)
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end
end
