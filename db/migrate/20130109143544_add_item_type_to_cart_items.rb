class AddItemTypeToCartItems < ActiveRecord::Migration
  def change
    add_column :cart_items, :item_type, :string
  end
end
