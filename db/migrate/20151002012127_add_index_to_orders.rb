class AddIndexToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :user_id, :string
    add_index :orders, :user_id
  end
end
