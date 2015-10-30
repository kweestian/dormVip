class ChangeColumInOrders < ActiveRecord::Migration
  def down
    remove_column :orders, :status
  end
end
