class UsersController < ApplicationController
  before_action :require_login, only: [:edit, :update]
  before_action :find_correct_user, only: [:edit, :update]
  before_action :not_login_user, only: [:new, :create]
  before_action :find_user, only: [:show]

  def show
    if @user
      @songs = @user.songs.order("created_at desc")
    else
      redirect_to root_path
      flash[:error] = "The user does not exist"
    end
  end

  def new
    @user = User.new
    @signup = true
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Regiter successfully"
      respond_to do |format|
        format.html {redirect_to root_path}
        format.js
      end
    else
      respond_to do |format|
        format.html {render 'new'}
        format.js
      end
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(update_user_params)
      flash[:success] = "Profile saved"
      respond_to do |format|
        format.html {redirect_to root_path}
        format.js
      end
    else
      flash[:error] = "Profile save fail"
      respond_to do |format|
        format.html {render 'edit'}
        format.js
      end
    end
  end

  private
  def find_correct_user
    @user = User.find_by_name(params[:id])
    unless current_user?(@user)
      flash[:warning] = "Permission Deny"
      redirect_to root_path
    end
  end

  def find_user
    @user = User.find_by_name(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def update_user_params
    params.require(:user).permit(:name, :avatar)
  end

  def not_login_user
    if logged_in?
      redirect_to root_path
      flash[:warning] = "User has already logged in"
    end
  end
end
