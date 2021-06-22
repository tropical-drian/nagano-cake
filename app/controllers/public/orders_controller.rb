class Public::OrdersController < ApplicationController
  include ApplicationHelper

  before_action :authenticate_customer!

  def new
    @cart_items = current_customer.cart_items
    @order = Order.new
  	@delivery = Delivery.where(customer: current_customer)
  end

  def check
    @cart_items = current_customer.cart_items
    @order = Order.new(customer: current_customer, payment_method: params[:order][:payment_method])

    # total_priceカラムにに請求額を代入する
    @order.total_price = billing(@order)

    # addressにご自身の住所の値がはいっている場合
    if params["r1"] then
      @order.postcode = current_customer.postal_code
      @order.address = current_customer.residence
      @order.name = current_customer.last_name + current_customer.first_name

    # addressに登録済住所から選択がはいっている場合
    elsif params["r2"] then
      @delivery = Delivery.find(params[:order][:delivery_id])
      @order.postcode = @delivery.postcode
      @order.address = @delivery.address
      @order.name = @delivery.name

    # addressに新しいお届け先がはいっている場合
    elsif params["r3"] then
      @order.postcode = params[:order][:postcode]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    end

  end

  def create
    @order = current_customer.orders.new(order_params)
    @order.save
    redirect_to complete_orders_path

    # 情報入力で新しいお届け先の場合deliveryに保存
    if  params["r3"] then
      current_customer.delivery.create(address_params)
    end

    # カート商品の情報を注文商品に移動する
    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
      OrderedProduct.create(product: cart_item.product, order: @order, quantity: cart_item.quantity, purchase_price: subtotal(cart_item))
    end

    # 注文完了後にカートを空にする
    @cart_items.destroy_all

  end

	def thanx
	end

	def index
    @orders = current_customer.orders
	end

	def show
	  @order = Order.find(params[:id])
    @ordered_products = @order.ordered_products
	end

  def complete
  end

  private

  def order_params
    params.require(:order).permit(:postcode, :address, :name, :payment_method, :total_price)
  end

  def address_params
    params.require(:order).permit(:postcode, :address, :name)
  end


end
