class UserSongsController < ApplicationController
  def index
    @songs = current_user.songs.order("created_at desc")
    respond_to do |format|
      format.js
    end
  end
end
