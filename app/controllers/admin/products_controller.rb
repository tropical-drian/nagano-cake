class Admin::ProductsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @products = Product.page(params[:page]).reverse_order
    #@products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @product_intax = ((@product.price * 1.1).round(2)).ceil
  end

  def new
    @product = Product.new
    @genres = Genre.all
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_product_path(@product), notice: 'You have created product successfully.'
    else
      @products = Product.all
      render 'index'
    end
  end

  def edit
    @product = Product.find(params[:id])
    @genres = Genre.all
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admin_product_path(@product), notice: 'You have updated product successfully.'
    else
      render 'edit'
    end
  end

  private
    def product_params
      params.require(:product).permit(:name, :image, :description, :price, :genre_id, :status, :genre_id)
    end

end
