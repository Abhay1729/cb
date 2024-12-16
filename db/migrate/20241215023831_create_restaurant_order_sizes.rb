class CreateRestaurantOrderSizes < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurant_order_sizes do |t|
      t.string :name
      t.references :restaurant
      t.float :low_limit, default: 0
      t.float :high_limit
      t.timestamps
    end
  end
end
