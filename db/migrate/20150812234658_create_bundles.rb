class CreateBundles < ActiveRecord::Migration
  def change
    create_table :bundles do |t|

      t.string :title
      t.text :description
      t.string :poster_image_url
      t.integer :total_price


      t.timestamps null: false
    end
  end
end
