class RestaurantOrderSize < ApplicationRecord
  LOW_LIMIT = 0
  HIGH_LIMIT = 999999
  belongs_to :restaurant
  has_many :restaurant_cashback_percents

  validates :name, presence: true, uniqueness: { scope: :restaurant_id }

  def amount_lies_in_range?(amount)
    return true if amount > (low_limit.presence || LOW_LIMIT) && amount <= (high_limit.presence || HIGH_LIMIT)
    false
  end
end
