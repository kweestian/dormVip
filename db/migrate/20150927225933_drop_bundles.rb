class DropBundles < ActiveRecord::Migration
  def change
    drop_table :bundles
  end
end
