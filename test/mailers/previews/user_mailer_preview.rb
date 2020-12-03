# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def welcome_email
    # Set up a temporary user for the preview
    user = User.new(email:"previewmailer@yopmail.com", password:"previewmailer")

    UserMailer.welcome_email(user)
  end
end
