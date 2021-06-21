class Public::CartItemsController < ApplicationController

  def index
    # @cart_items = current_customer.cart_items
    # @cart_items = CartItem.find(current_customer.id)
  end

  def update
  end

  def create
  end

  def destroy
  end

  def destroy_all
  end

  private

  def params_cart_item
    params.require(:cart_item).permit(:quantity, :product_id)
  end

end
