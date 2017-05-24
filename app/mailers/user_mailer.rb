class UserMailer < ActionMailer::Base
  default from: "2310khonggilakhongthe28@gmail.com"


  def activation_needed_email(user)
    @user = user
    @url  = "http://127.0.0.1:3000/actives/#{user.activation_token}/update"
    mail(:to => user.email,
         :subject => "Welcome to the Music Share")
  end

  def activation_success_email(user)
    @user = user
    @url  = "http://127.0.0.1:3000/login"
    mail(:to => user.email,
         :subject => "Your account is confirmed")
  end
end