class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!


  def top
    @orders = Order.all.page(params[:page]).per(10)
  end
  
  def index
    @orders = Order.where(customer_id: params[:id]).page(params[:page]).per(10)
    render :top
  end

  def show
    @order = Order.find(params[:id])
  end

  def update

  end

	private
	def order_params
		  params.require(:order).permit(:order_status)
	end
end
