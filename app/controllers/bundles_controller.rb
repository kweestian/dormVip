class BundlesController < ApplicationController
  

  def new
    @bundle = Bundle.new
  end

  def index
    @bundles = Bundle.all
  end

  def create
    @bundle = Bundle.new(bundle_params)
    if @bundle.save
      notice: "succesfully saved a bundle!"
    end
  end

  def show
    @bundle = Bundle.find(params[:id])
  end

  def edit
    @bundle = Bundle.find(params[:id])
  end

  def update
    @bundle = Bundle.find(params[:id])
    @bundle.update_attributes!(bundle_params)
    if @bundle.save 
      notice: "succesfully update bundle"
    else
      render :edit
    end
  end

  def destroy
    @bundle = Bundle.find(params[:id])
    @bundle.destroy
  end

  protected 

  def bundle_params
    params.require(:bundle).permit(:title, :description, :poster_image_url, :total_price, :code, :number_of_products)
    
  end

end
