class CreateRestaurantCashbackPercents < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurant_cashback_percents do |t|
      t.references :restaurant_level
      t.references :restaurant_order_size
      t.float :cb_percent, default: 0
      t.timestamps
    end
  end
end
