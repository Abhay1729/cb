class RestaurantLevel < ApplicationRecord
  belongs_to :restaurant
  has_many :user_restaurant_levels
  has_many :restaurant_cashback_percents

  validates :name, presence: true, uniqueness: { scope: [:restaurant_id, :threshold] }
end
