class CartsController < ApplicationController
  before_action :authenticate_user!, only: [:checkout]

  def checkout
    @order = current_user.orders.build
    @order.build_info
  end

  def index
  end

  def destroy
    current_cart.destroy
    redirect_to root_path, notice: "購物車已清空"
  end
end
