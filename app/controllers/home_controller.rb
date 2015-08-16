class HomeController < ApplicationController
  def index
    @products = Product.all
    @bundles = Bundle.all
  end
end
