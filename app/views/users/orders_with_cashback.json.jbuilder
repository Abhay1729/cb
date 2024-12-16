if @orders.present?
  json.orders do
    json.array! @orders do |order|
      json.id order.id
      json.restaurant_name order.restaurant.name
      cb = order.cashback
      json.cb_redeemable cb.amount
      if cb.status == 'redeemed'
        json.cb_already_redeemed order.cashback.amount
      else
        json.cb_already_redeemed 0
      end
      json.sub_total order.amount
    end
  end
end
