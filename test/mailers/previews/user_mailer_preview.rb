# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/user_created
  def admin_confirmation
    UserMailer.admin_confirmation
  end

  def user_affirmation
    UserMailer.user_affirmation
  end

  def user_confirmation
    UserMailer.user_confirmation
  end

end
