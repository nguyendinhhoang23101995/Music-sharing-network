module UsersHelper
  def current_user?(user)
    user == current_user
  end

  def require_login
    if !logged_in?
      redirect_to login_url
      flash[:warning] = "Login First"
    end
  end
end
