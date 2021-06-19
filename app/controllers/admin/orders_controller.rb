class Admin::OrdersController < ApplicationController
  
  def top
    @orders = Order.all.page(params[:page]).per(10)
  end

  def show
  end

  def update
  end

end
