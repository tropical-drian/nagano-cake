class Public::ProductsController < ApplicationController

  before_action :authenticate_customer!,only: [:show]

  def top
    @products = Product.all.order(created_at: :asc) #:asc,古い順
  end

  def about
  end

  def index
  end

  def show
  end

end
