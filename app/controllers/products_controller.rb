class ProductsController < ApplicationController
  def index
    @products = Product.all
    order = Order.where(user_id = current_user.id)
    @order_item = current_user.order.order_items.new
  end
end
