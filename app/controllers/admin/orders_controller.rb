class Admin::OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required
  before_action :set_order, except: [:index]
  layout 'admin'

  def index
    @orders = Order.order("id DESC")
  end

  def show
    @order_info = @order.info
    @order_items = @order.items
  end

    def ship
    @order.ship!
    redirect_to :back
  end

  def shipped
    @order.deliver!
    redirect_to :back
  end

  def cancel
    @order.cancell_order!
    redirect_to :back
  end

  def return
    @order.return_good!
    redirect_to :back
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end
end