class CreateUserRestaurantLevels < ActiveRecord::Migration[7.0]
  def change
    create_table :user_restaurant_levels do |t|
      t.references :user
      t.references :restaurant_level
      t.timestamps
    end
  end
end
