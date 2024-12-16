class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :user
      t.references :restaurant
      t.references :restaurant_order_size
      t.float :amount
      t.float :amount_paid, default: 0
      t.string :status
      t.text :items
      t.string :restaurant_txn_id
      t.float :cashback_offered, default: 0
      t.datetime :delivery_date
      t.timestamps
    end
  end
end
