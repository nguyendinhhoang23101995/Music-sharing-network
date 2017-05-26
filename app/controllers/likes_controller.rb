class LikesController < ApplicationController
  before_action :require_login, :find_likeable

  include LikesHelper

  def create
    current_user.like!(params[:likeable_type], params[:likeable_id])
    respond_to do |format|
      format.html {redirect_to correct_path}
      format.js
    end
  end

  def destroy
    current_user.unlike!(params[:likeable_type], params[:likeable_id])
    respond_to do |format|
      format.html {redirect_to correct_path}
      format.js
    end
  end

  private
  def find_likeable
    @likeable = {likeable_type: params[:likeable_type], likeable_id: params[:likeable_id]}
  end

end