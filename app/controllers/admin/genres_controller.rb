class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!

  def index
    @genres = Genre.all.page(params[:page]).per(7).order("created_at DESC")
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admin_genres_path, notice: 'You have created genre successfully.'
    else
      @genres = Genre.all.page(params[:page]).per(7).order("created_at DESC")
      redirect_to admin_genres_path, notice: 'Genre name is necessary.'
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to admin_genres_path, notice: 'You have updated genre successfully.'
    else
      render 'edit'
    end
  end

  private

    def genre_params
      params.require(:genre).permit(:name)
    end

end
