class SearchController < ApplicationController
  def index
    @hot_songs = Song.hot_songs
    @songs = Song.search(params[:title]).page params[:page]
  end

  def show
    @hot_songs = Song.hot_songs
    @songs = Song.search(params[:title]).page params[:page]
  end
end
