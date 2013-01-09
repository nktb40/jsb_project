class AddCustomerNameToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :customer_name, :string
    add_column :orders, :email, :string
    add_column :orders, :adress, :text
    add_column :orders, :phone, :string
    add_column :orders, :comments, :text
    add_column :orders, :status, :string
    add_column :orders, :delivering_method, :string
    remove_column :orders, :quantity
    remove_column :orders, :product_id
  end
end
