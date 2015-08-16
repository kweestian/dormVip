class AddTypeToBundles < ActiveRecord::Migration
  def change
    add_column :bundles, :type, :string
  end
end
