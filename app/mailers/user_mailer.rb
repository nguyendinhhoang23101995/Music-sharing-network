class UserMailer < ActionMailer::Base
  default from: "2310khonggilakhongthe28@gmail.com"


  def activation_needed_email(user)
    @user = user
    @url  = "#{root_url}actives/#{user.activation_token}"
    mail(:to => user.email,
         :subject => "Welcome to the Music Share")
  end

  def activation_success_email(user)
    @user = user
    @url  = "#{root_url}login"
    mail(:to => user.email,
         :subject => "Your account is confirmed")
  end
end