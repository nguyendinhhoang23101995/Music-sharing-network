class ActivesController < ApplicationController

  def show
    if (@user = User.load_from_activation_token(params[:id]))
      @user.activate!
      flash[:success] = "User was activated"
      auto_login(@user)
    else
      not_authenticated
    end
  end
end
