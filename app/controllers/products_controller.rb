class ProductsController < ApplicationController
  before_action :set_product, except: [:new, :create, :index]

  #BEST 將產品加入購物車，所以是放在products_controller
  def add_to_cart
    if !current_cart.items.include?(@product)
      #current_cart.items << @product
      current_cart.add_product_to_cart(@product)
      flash[:notice] = "你已成功將 #{@product.title} 加入購物車"
    else
      flash[:warning] = "你的購物車內已有此物品"
    end

    redirect_to :back
  end

  def show
    
  end

  def index
    @products = Product.all
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

end