class ActivesController < ApplicationController

  def show
    if (@user = User.load_from_activation_token(params[:id]))
      @user.activate!
      flash[:success] = "User was activated"
      auto_login(@user)
      respond_to do |format|
        format.html { redirect_back_or_to root_path}
        format.js
      end
    else
      not_authenticated
    end
  end
end
