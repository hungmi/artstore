class Cart < ActiveRecord::Base
  # cart_items是對照表
  has_many :cart_items, dependent: :destroy
  # items則是拉產品的替身
  has_many :items, through: :cart_items, source: :product

  def add_product_to_cart(product)
    items << product
  end
  def total_price
    cart_items.inject(0) { |sum, item| sum + (item.product.price * item.quantity) }
  end
  def find_cart_item(product)
    cart_items.find_by(product_id: product)
  end
end
