class BundlesController < ApplicationController
  before_filter :set_bundle, :only => [:show, :edit, :update, :destroy]
  

  def new
    @bundle = Bundle.new
    @bundle.products.build
  end

  def index
    @bundles = Bundle.all
  end

  def create
    @bundle = Bundle.new(bundle_params)
    if @bundle.save
      flash[:notice] = "you have just created a bundle!"
      redirect_to bundles_url
    else
      flash[:notice] = "unable to save"
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    @bundle.update_attributes!(bundle_params)
    @bundle.save
  end

  def destroy
    @bundle.destroy
  end

  protected 

  def set_bundle
    @bundle = Bundle.find(params[:id])
  end

  def bundle_params
    params.require(:bundle).permit(:title, :description, :poster_image_url, :total_price, :code, :number_of_products, products_attributes: [ :id, :name, :_destroy ])
  end

end
