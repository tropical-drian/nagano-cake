class Admin::SearchsController < ApplicationController
  before_action :authenticate_admin!

  def searchs
    @products = Product.search(params[:keyword])
    @keyword = params[:keyword]
  end

end
