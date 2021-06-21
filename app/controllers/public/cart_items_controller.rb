class Public::CartItemsController < ApplicationController


  before_action :set_cart_item, only: [:update, :destroy]
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items
  end


  def update
    @cart_item.update(quantity: params[:cart_item][:quantity].to_i)
    @price = subtotal(@cart_item).to_s(:delimited)
    @cart_items = current_cart
    @total = product_total_price(@cart_items).to_s(:delimited)
  end

  # def create
  #   @cart_item = current_customer.cart_items.new
  #   # カートの中に同じ商品がある場合は数だけ追加する
  #   @add_cart_item =  CartItem.find_by(product: @cart_item.product)

  #   end
  # end

  def create
    @cart_item = current_customer.cart_items.new(params_cart_item)
    @update_cart_item = CartItem.find_by(product: @cart_item.product)
    if @update_cart_item.present? && @cart_item.valid?
       @cart_item.quantity += @update_cart_item.quantity
       @add_cart_item.destroy
    end

    flash[:notice] = "#{@cart_item.product.name}をカートに追加しました"
    redirect_to cart_items_path
	end

  def destroy
    @cart_item.destroy
    redirect_to current_cart_items
  end


  def all_destroy
    @cart = current_cart
    @cart.destroy
    session[:cart_id] = nil
    respond_to do |format|
      format.html { redirect_to cart_items_path, notice: 'カートが空になりました。' }
      format.json { head :no_content }
    end
  end

  private

  def params_cart_item
    params.require(:cart_item).permit(:quantity, :product_id)
  end
end