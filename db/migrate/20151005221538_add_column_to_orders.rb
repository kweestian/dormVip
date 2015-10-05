class AddColumnToOrders < ActiveRecord::Migration
  def change
    add_reference :orders, :order_item, index: true, foreign_key: true
  end
end
