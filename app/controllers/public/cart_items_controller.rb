class Public::CartItemsController < ApplicationController
  
  
  def index
    @cart_items = current_customer.cart_items
  end

	def update
	end

	def create
    @cart_item = current_customer.cart_items.new(params_cart_item)
    @update_cart_item = CartItem.find_by(product: @cart_item.product)

    @cart_item.save
    flash[:notice] = "#{@cart_item.product.name}をカートに追加しました"
    redirect_to cart_items_path
	end

	def all_destroy
	end

	def destroy
	end

  private

  def params_cart_item
    params.require(:cart_item).permit(:quantity, :product_id)
  end
end