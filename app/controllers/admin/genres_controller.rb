class Admin::GenresController < ApplicationController

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admin_genres_path, notice: 'You have created genre successfully.'
    else
      @genres = Genre.all
      render 'index'
    end
  end

  def edit
  end

  def update
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
