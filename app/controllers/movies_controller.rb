class MoviesController < ApplicationController
    before_action :find, only: [:show, :edit, :update, :destroy]


  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.save
    redirect_to movie_path(@Movie)
  end

  def edit
  end

  def update
    @movie.update(movie_params)
    redirect_to movie_path(@Movie)
  end

  def destroy
    @movie.destroy
    redirect_to movies_path
  end


  private

  def Movie_params
    params.require(:movie).permit(:title, :overview, :poster_url, :rating)
  end

  def find
    @movie = Movie.find(params[:id])
  end

end
