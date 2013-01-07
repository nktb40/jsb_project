class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.string :product_code
      t.string :product_status
      t.string :image

      t.timestamps
    end
  end
end
