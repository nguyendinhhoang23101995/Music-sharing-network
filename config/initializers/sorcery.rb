
Rails.application.config.sorcery.submodules = [:remember_me, :user_activation]

Rails.application.config.sorcery.configure do |config|
  config.user_config do |user|
    user.username_attribute_names = [:email]
    user.user_activation_mailer = UserMailer
  end
  config.user_class = "User"
end
