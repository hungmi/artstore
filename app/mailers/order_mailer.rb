class OrderMailer < ApplicationMailer
  #顧客下單之後要收到一封通知信
  def notify_order_placed(order)
    @order       = order
    @user        = order.user
    @order_items = @order.items
    @order_info  = @order.info

    mail(to: @user.email , subject: "[Artstore] 感謝您完成本次的下單，以下是您這次購物明細 #{order.token}")
  end
end
