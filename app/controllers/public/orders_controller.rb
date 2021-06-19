class Public::OrdersController < ApplicationController

  def new
  end

  def check
  end

  def create
  end

  def complete
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @ordered_product = @order.ordered_product
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :payment_method, :total_price)
  end


end
