class Restaurant < ApplicationRecord
  has_many :orders
  has_many :restaurant_order_sizes
  has_many :restaurant_levels
  has_many :user_restaurant_levels, through: :restaurant_levels
  has_many :users, through: :user_restaurant_levels

  validates :name, presence: true, uniqueness: true

  def level_for_user(user)
    user_restaurant_levels.find_by(user: user)&.restaurant_level
  end
end
