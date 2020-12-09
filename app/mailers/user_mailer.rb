class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome
    @user = params[:user] # Instance variable => available in view
    mail(to: @user.email, subject: 'Welcome to Its a Date')
  end

  def create(user)
    @user = user
    mail(to: @user.email, subject: 'Request for upload date')
  end

  def developer(user)
    @user = user
    mail(to: "itsadate11220@gmail.com", subject: 'Request for upload date')
  end
end
