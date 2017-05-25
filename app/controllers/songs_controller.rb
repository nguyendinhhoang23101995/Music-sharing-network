class SongsController < ApplicationController
  before_action :require_login, only: [:new, :create, :collect, :edit, :update, :destroy]

  def index
    @user_panel = true
  end

  def new
    @song = current_user.songs.build
  end

  def show
    @song = Song.find(params[:id])
  end

  def create
    @song = current_user.songs.build(song_params)
    if @song.save
      flash[:success] = "Publish success"
      respond_to do |format|
        format.html {redirect_to root_path}
        format.js
      end
    else
      flash[:error] = "Publish fail"
      respond_to do |format|
        format.html {render 'new'}
        format.js
      end
    end
  end

  def edit
  end

  def update
    if @song.update_attributes song_params
      flash[:success] = "Successfully updated"
      respond_to do |format|
        format.html {redirect_to @song}
        format.js
      end
    else
      respond_to do |format|
        format.html {render 'edit'}
        format.js
      end
    end
  end

  def destroy
    @song = current_user.songs.find(params[:id])
    if @song.destroy
      flash[:success] = "Song was successfully deleted"
      respond_to do |format|
        format.html {redirect_to root_path}
        format.js
      end
    end
  end

  private

  def song_params
    params.require(:song).permit(:title, :file, :singer, :artist, :pic, :description)
  end

  def find_song
    @song = current_user.songs.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:warning] = "Permission denied"
    redirect_to root_path
  end
end
