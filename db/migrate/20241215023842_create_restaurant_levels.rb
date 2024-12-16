class CreateRestaurantLevels < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurant_levels do |t|
      t.string :name
      t.references :restaurant
      t.float :threshold
      t.timestamps
    end
  end
end
