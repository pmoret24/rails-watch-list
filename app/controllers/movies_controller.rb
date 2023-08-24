class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def show
    @movies = Movie.find(params[:id])
  end

  def new
    @movies = Movie.new
  end

  def create
    @movies = Movie.new(movies_params)
    @Movies.save

    redirect_to movies_path
  end

  def movies_params
    params.require(:movies).permit(:title, :overview, :poster_url, :rating)
  end
end
