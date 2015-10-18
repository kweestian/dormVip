class OrdersController < ApplicationController
  before_action :set_order, only: [:edit, :update, :destroy]

  # todo set up relations instead of nth_item

  def new
    @order = current_user.orders.new
    @asked_frequency = params[:asked_frequency]
    @frequencies = ["Once", "For a Month", "Semester",  "For a Year"]
  end

  def edit
  end

  def create
    @order = current_user.orders.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to '/', notice: 'Order was succesfully created! You Will receive an email shortly confirming' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.where(user_id = current_user.id)
    end

    def order_params

        params.require(:order).permit(:first_item, :second_item, :third_item, :user_id, :frequency, order_items_attributes: [ :id, :product_id])
    end

end
