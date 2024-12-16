class Cashback < ApplicationRecord
  CB_STATUS = %w[unredeemed redeemed expired]
  belongs_to :order
  belongs_to :user

  validates :amount, :status, presence: true
  validates :status, inclusion: { in: CB_STATUS }

  after_create_commit :update_user_cb_redeemable
  # after_update_commit :update_user_cb_info
  before_validation :set_status

  def set_status
    return if persisted?

    self.status = 'unredeemed'
  end

  private

  def update_user_cb_redeemable
    user.update(cb_redeemable: user.cb_redeemable + amount)
  end

  def update_user_cb_info
    if saved_change_to_attribute(:status) && status == 'expired'
      user.update(cb_redeemable: user.cb_redeemable - amount)
    end
  end
end
