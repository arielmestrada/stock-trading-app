class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.user_created.subject
  #
  def admin_confirmation(user)
    @admins = User.where(role: 'admin').pluck(:email)
    @user = user
    mail to: @admins, subject: 'Sign Up Confirmation'
  end
  
  def user_affirmation(user)
    @user = user
    mail to: @user.email, subject: 'Account Pending Confirmation'
  end

  def user_confirmation(user)
    @user = user
    mail to: @user.email, subject: 'Account Confirmed'
  end
  
end
