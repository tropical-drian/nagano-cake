class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!


  def top
    @orders = Order.all.page(params[:page]).per(10)
  end

  def customer_top
    @orders = Order.where(customer_id: params[:id]).page(params[:page]).per(10)
    render :top
  end

  def show
    @order = Order.find(params[:id])
    @ordered_products = @order.ordered_products
  end

  def update
    @order.update(status: params[:status])
    redirect_to admin_order_path(@order)
  end

	private
	def order_params
		  params.require(:order).permit(:status)
	end
end
