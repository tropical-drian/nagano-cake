class Public::ProductsController < ApplicationController

  before_action :authenticate_customer!,only: [:show]

  def top
    @products = Product.all.order(created_at: :asc) #:asc,古い順
    @genres   = Genre.
  end

  def about
  end

  def index
    @genres   = Genre.all
    @products = Product.where(is_sale: true).page(params[:page]).per(8)
  end

  def show
    @products = Product.all
    @product  = Product.find(params[:id])
  end

end
