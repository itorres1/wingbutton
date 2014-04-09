class AddOrderstringtoOrders < ActiveRecord::Migration
  def change
    change_table :orders do |t|
      t.text :order_string
    end
  end
end
