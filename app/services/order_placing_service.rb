class OrderPlacingService
  def initialize(cart, order)
    @order = order
    @cart = cart
  end

  def place_order!
    @order.build_item_cache_from_cart(@cart)
    @order.calculate_total!(@cart)
    @cart.clean!
    # 因為我們還沒實作用 mailgun 寄信 ( 回家作業 1 & 2 )，所以要暫時先把訂單建立時寄封通知信的功能先關掉
    # OrderMailer.notify_order_placed(@order).deliver!
  end
end