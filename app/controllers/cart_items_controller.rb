class CartItemsController < ApplicationController
  before_action :set_item
  def destroy
    #BEST 刪除對照表中item與product的連結
    @item.destroy
    redirect_to carts_path
  end
  def update
    if @item.product.quantity >= item_params[:quantity].to_i
      if @item.update(item_params)
        flash[:success] = 'updated successfully.'
      else
        flash[:danger] = 'updated failed.'
      end
    else
      flash[:warning] = '數量不足無法加入購物車.'
    end
    redirect_to carts_path
  end

  private

  def set_item
    @item = current_cart.cart_items.find_by(product_id: params[:id])
  end

  def item_params
    params.require(:cart_item).permit(:quantity)
  end
end
