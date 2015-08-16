class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|

      t.string :title
      t.integer :price
      t.references :bundle, index: true
      t.text :description
      t.string :code


      t.timestamps null: false
    end
  end
end
