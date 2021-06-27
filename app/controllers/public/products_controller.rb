class Public::ProductsController < ApplicationController

  before_action :authenticate_customer!,only: [:show]

  def top
    @products = Product.all.order(created_at: :asc)#:asc,古い順
    @genres = Genre.all
  end

  def about
  end

  def index
    @genres = Genre.all
    @products = Product.where(status: true).page(params[:page]).per(8)
  end

  def show
    @products = Product.all
    @product =  Product.find(params[:id])
    @cart_item = CartItem.new
  end

  private

    def product_params
      params.require(:product).permit(:name, :image, :description, :price, :genre_id, :status, :genre_id)
    end

end