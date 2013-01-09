class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
		t.integer  "product_id"
    	t.integer  "quantity"
    	t.datetime "created_at", :null => false
      t.datetime "updated_at", :null => false
      t.timestamps
    end
  end
end
