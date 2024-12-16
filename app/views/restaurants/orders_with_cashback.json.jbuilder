if @orders.present?
  json.orders do
    json.array! @orders do |order|
      json.id order.id
      json.user_name order.user.name
      cb = order.cashback
      json.cashback_earned cb&.amount
      json.status cb&.status
      redeemed_date = cb&.status == 'redeemed' ? cb.updated_at : nil
      json.redeemed_date redeemed_date
      json.invoice_id order.restaurant_txn_id
    end
  end
end
