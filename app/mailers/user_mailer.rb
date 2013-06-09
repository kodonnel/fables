class UserMailer < ActionMailer::Base
  default from: "auto-confirm@fables.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset (user)
    @user = user
    mail :to => user.email, :subject => "Fables Password Reset"
  end

  def account_activation (user)
    @user = user
    mail :to => user.email, :subject => "Fables Account Activation"
  end
end
