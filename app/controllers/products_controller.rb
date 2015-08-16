class ProductsController < ApplicationController

  def show
    @product = Product.find(params[:id])
  end

  def index
    @products = Product.all
  end


  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.save
  end

  
  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update_attributes!(product_params)
    @product.save
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
  end

  protected 

  def bundle_params
    params.require(:product).permit(:title, :price, :product, :description, :code)
    
  end

end
