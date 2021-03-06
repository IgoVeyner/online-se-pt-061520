class ScaryMoviesController < ApplicationController
  before_action :find_movie, only: [:show, :edit, :update, :destroy]

  def index
    @scary_movies = ScaryMovie.all
  end

  def new
    @user = User.new
    @scary_movie = ScaryMovie.new
  end

  def show
    @watch_list_item = WatchListItem.new
  end

  def create
    byebug
    @scary_movie = ScaryMovie.new(scary_movie_params)
    if @scary_movie.save
      redirect_to scary_movie_path(@scary_movie)
    else
      render :new
    end
  end

  def update
    @scary_movie.update(scary_movie_params)
    redirect_to scary_movie_path(@scary_movie)
  end

  def destroy
    @scary_movie.destroy
    redirect_to scary_movies_path
  end

  private

  def find_movie
    @scary_movie = ScaryMovie.find_by(id: params[:id])
  end

  def scary_movie_params
    params.require(:scary_movie).permit(:title, :scariness_rating)
  end

end
