class Admin::SearchsController < ApplicationController

  def search
    @products = Product.search(params[:keyword])
    @keyword = params[:keyword]
  end

end
