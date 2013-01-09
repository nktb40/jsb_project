class AddUserIdToCartItem < ActiveRecord::Migration
  def change
    add_column :cart_items, :user_id, :integer
    drop_table :carts
  end
end
