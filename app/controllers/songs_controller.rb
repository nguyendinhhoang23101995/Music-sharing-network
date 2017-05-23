class SongsController < ApplicationController
  before_action :require_login, only: [:new, :create, :collect, :edit, :update, :destroy]

  def index
    @user_panel = true
  end
end
