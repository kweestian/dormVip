class Order < ActiveRecord::Base
  has_many :order_items, dependent: :destroy
  before_save :update_subtotal
  accepts_nested_attributes_for :order_items

  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end
private
  def set_order_status
    self.order_status_id = 1
  end

  def update_subtotal
    self[:subtotal] = subtotal
  end
end
