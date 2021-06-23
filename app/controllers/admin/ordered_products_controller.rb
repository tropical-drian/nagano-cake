class Admin::OrderedProductsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @ordered_product = OrderedProduct.find(params[:id])
    @ordered_product.update(ordered_product_params)
    redirect_to admin_order_path(@ordered_product.order)
  end
end
