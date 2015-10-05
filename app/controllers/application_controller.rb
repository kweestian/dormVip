class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_order
  include SessionsHelper

  # def current_order
  #   if current_user && !current_user.order_id.nil?
  #     if !session[:order_id].nil?
  #       Order.where(user_id: current_user[:id], id: session[:order_id])
  #     else
  #       current_user.orders.new
  #     end
  #   else
  #     current_user.orders.new
  #   end
  # end
end
