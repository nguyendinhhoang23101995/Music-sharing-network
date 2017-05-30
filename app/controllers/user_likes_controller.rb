class UserLikesController < ApplicationController
  def index
    songs_id = current_user.likes.where("likeable_type = ?", "Song").collect(&:likeable_id)
    @songs = Song.find(songs_id).reverse!
    respond_to do |format|
      format.js
    end
  end
end
