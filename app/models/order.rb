class Order < ApplicationRecord
  ORDER_STATUS = %w[initiated partially_paid cancelled completed]
  belongs_to :user
  belongs_to :restaurant
  belongs_to :restaurant_order_size
  has_one :cashback

  validates :amount, :status, presence: true
  validates :status, inclusion: { in: ORDER_STATUS }
  validate :paid_amount_for_completion

  before_validation :set_status, :set_order_size, :create_user_restaurant_level
  after_commit :create_cashback

  def set_status
    return if persisted?
    self.status = 'initiated'
  end

  def set_order_size
    return if persisted?
    sizes = restaurant.restaurant_order_sizes
    sizes.each do |size|
      if size.amount_lies_in_range?(amount)
        self.restaurant_order_size = size
        break
      end
    end
  end

  def create_user_restaurant_level
    return if restaurant.level_for_user(user).present?
    UserRestaurantLevel.create(user: user, restaurant_level: restaurant.restaurant_levels.first)
  end

  def get_cb_amount
    percent = RestaurantCashbackPercent.find_by(restaurant_order_size: restaurant_order_size, restaurant_level: restaurant.level_for_user(user)).cb_percent
    ((amount * percent)/100.0).round(2)
  end

  def create_cashback
    if saved_change_to_attribute(:status) && status == 'completed'
      Cashback.create(order: self, user: user, amount: get_cb_amount)
    end
  end

  def paid_amount_for_completion
    errors.add(:amount_paid, "should match order amount to complete order, paid: #{amount_paid}, order amount: #{amount}") if status == 'completed' && amount != amount_paid
  end
end
