class User < ApplicationRecord
  has_many :orders
  has_many :cashbacks
  has_many :user_restaurant_levels
  has_many :restaurant_levels, through: :user_restaurant_levels
  has_many :restaurants, through: :restaurant_levels

  validates :name, :email, presence: true
  validates :email, uniqueness: true

  def level_for_restaurant(restaurant)
    restaurant_levels.find_by(restaurant: restaurant)
  end
end
