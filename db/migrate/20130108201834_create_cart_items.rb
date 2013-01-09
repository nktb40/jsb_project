class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
    	t.integer  "user_id"
		t.integer  "product_id"
    	t.integer  "quantity"
    	t.datetime "created_at", :null => false
      t.datetime "updated_at", :null => false
      t.timestamps
    end
  end
end
