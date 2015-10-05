class OrdersController < ApplicationController
  def new
  end

  def create
  end

  private

  def hotel_params
      params.require(:hotel).permit(:frequency, order_items_attributes: [ :id, :product_id])
  end

end
