class Public::OrdersController < ApplicationController

  before_action :authenticate_customer!

  def new
    @order = Order.new
  	@delivery = Delivery.where(customer: current_customer)
  end

  def check
    @order = Order.new(customer: current_customer, payment_method: params[:order][:payment_method])

    # total_priceカラムにに請求額を代入する
    @order.total_price = billing(@order)

    # addressにご自身の住所の値がはいっている場合
    if params[:order][:addresses] == 0
      @order.postal_code = current_customer.postal_code
      @order.address     = current_customer.residence
      @order.name        = current_customer.last_name + current_customer.first_name

    # addressに登録済住所から選択がはいっている場合
    elsif params[:order][:addresses] == 1
      @delivery = Delivery.find(params[:order][:delivery_id])
      @order.postal_code = @delivery.postal_code
      @order.address     = @delivery.address
      @order.name        = @delivery.name

    # addressに新しいお届け先がはいっている場合
    elsif params[:order][:addresses] == 2
      @order.postal_code = params[:order][:postal_code]
      @order.address     = params[:order][:address]
      @order.name        = params[:order][:name]
    end

  end

  def create
    @order = current_customer.orders.new(order_params)
    @order.save
    redirect_to orders_complete_path

    # 情報入力で新しいお届け先の場合deliveryに保存
    if  params[:order][:addresses] == 2
      current_customer.delivery.create(address_params)
    end

    # カート商品の情報を注文商品に移動する
    @cart_item = current_cart
    @cart_item.each do |cart_item|
      OrderedProduct.create(product: cart_item.product, order: @order, quantity: cart_item.quantity, purchase_price: subtotal(cart_item))
    end

    # 注文完了後にカートを空にする
    @cart_item.destroy_all

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

  def index
    @orders = current_customer.orders
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :payment_method, :total_price)
  end

  def address_params
    params.require(:order).permit(:postal_code, :address, :name)
  end


end
