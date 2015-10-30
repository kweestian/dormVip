class AddPaidStatusToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :paid_status, :boolean, :default => false
  end
end
