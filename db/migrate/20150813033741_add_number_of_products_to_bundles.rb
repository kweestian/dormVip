class AddNumberOfProductsToBundles < ActiveRecord::Migration
  def change
    add_column :bundles, :number_of_products, :integer
  end
end
