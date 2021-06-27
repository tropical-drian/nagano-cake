class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!

  def index
    @genres = Genre.all.page(params[:page]).per(7).order("created_at DESC")
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
<<<<<<< HEAD
    if @genre.save
      redirect_to admin_genres_path, notice: 'You have created genre successfully.'
    else
      @genres = Genre.all.page(params[:page]).per(7).order("created_at DESC")
      redirect_to admin_genres_path, notice: 'Genre name is necessary.'
    end
=======
  if @genre.save
    redirect_to admin_genres_path, notice: 'You have created genre successfully.'
  else
    @genres = Genre.all.page(params[:page]).per(7).order("created_at DESC")
    flash.now[:danger] = 'Genre name is necessary!'
    render 'index'
  end
>>>>>>> 6535c75c29d88ccfcb0e23be37f9834ddbd7bba8
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
<<<<<<< HEAD
    if @genre.update(genre_params)
      redirect_to admin_genres_path, notice: 'You have updated genre successfully.'
    else
      render 'edit'
    end
=======
  if @genre.update(genre_params)
    redirect_to admin_genres_path, notice: 'You have updated genre successfully.'
  else
    flash.now[:danger] = 'Genre name is necessary!'
    render 'edit'
  end
>>>>>>> 6535c75c29d88ccfcb0e23be37f9834ddbd7bba8
  end

  private


  def genre_params
    params.require(:genre).permit(:name)
  end

end