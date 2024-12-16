class UserRestaurantLevel < ApplicationRecord
  TIME_PERIOD = 12.months
  belongs_to :user
  belongs_to :restaurant_level

  validate :one_level_for_user

  def upgrade_level
    levels = restaurant_level.restaurant.restaurant_levels
    user_expenditure = user.orders.where(status: 'completed', created_at: (Date.today-TIME_PERIOD)..Date.today).sum :amount
    old_diff = user_expenditure - restaurant_level.threshold.to_f
    new_level = restaurant_level
    levels.each do |level|
      diff = user_expenditure - level.threshold.to_f
      new_level = level if diff > 0 && diff < old_diff
    end
    self.update(restaurant_level: new_level)
  end

  def one_level_for_user
    errors.add(:base, :level_already_exists) if restaurant_level.restaurant.user_restaurant_levels.where(user: user).excluding(self).count > 0
  end
end
