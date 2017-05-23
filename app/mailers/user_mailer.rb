class UserMailer < ActionMailer::Base
  default from: "2310khonggilakhongthe28@gmail.com"

  def reset_password_email(user)
    @user = user
    @url  = edit_password_reset_url(user.reset_password_token)
    mail(:to => user.email,
         :subject => "#{t('mailer.subject.reset_password')}")
  end

  def activation_needed_email(user)
    @user = user
    @url  = "http://127.0.0.1:3000/users/#{user.activation_token}/activate"
    mail(:to => user.email,
         :subject => "#{t('mailer.subject.welcome')}")
  end

  def activation_success_email(user)
    @user = user
    @url  = "http://127.0.0.1:3000/login"
    mail(:to => user.email,
         :subject => "#{t('mailer.subject.done')}")
  end
end