class AddColumnToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :first_item, :string
    add_column :orders, :second_item, :string
    add_column :orders, :third_item, :string
  end
end
