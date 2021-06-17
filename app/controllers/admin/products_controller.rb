class Admin::ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @produt = Product.new
    @genres = Genre.all
  end

  def create
    @product = Product.new(product_params)
    @product.save!
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to admin_product_path(@product), notice: 'You have updated genre successfully.'
    else
      render 'edit'
    end
  end

  private
    def product_params
      params.require(:product).permit(:name, :image, :description, :price, :genre_id, :status)
    end

end
