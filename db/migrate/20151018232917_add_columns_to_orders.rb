class AddColumnsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :phone_number, :string
    add_column :orders, :delivery_address, :string
    add_column :orders, :delivery_time, :datetime
  end
end
