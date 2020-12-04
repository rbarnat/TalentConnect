# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def welcome_email
    # Set up a temporary user for the preview
    user = User.new(email:"previewmailer@yopmail.com", password:"previewmailer", first_name:"John")
    UserMailer.welcome_email(user)
  end

  def booking_user_confirmation
    appointment = Appointment.find(1)
    UserMailer.booking_user_confirmation(appointment)
  end
end
