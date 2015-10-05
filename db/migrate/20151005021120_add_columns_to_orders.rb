class AddColumnsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :frequency, :string
    add_column :orders, :type, :string
  end
end
