class RestaurantCashbackPercent < ApplicationRecord
  belongs_to :restaurant_order_size
  belongs_to :restaurant_level

  validates :cb_percent, presence: true
end
