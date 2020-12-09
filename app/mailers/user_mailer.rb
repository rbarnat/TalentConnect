class UserMailer < ApplicationMailer
default from: 'contact.talentconnect100@gmail.com'

  def welcome_email(user)
    @user = user
    @urlHomePage = root_url
    @urlLogin = new_user_session_url
    
    mail(to: @user.email, subject: 'Bienvenue sur TalentConnect !')
  end

  def booking_user_confirmation(appointment)
    @user = appointment.apprentice
    @appointment = appointment
    @urlLogin = new_user_session_url

    mail(to: @user.email, subject: 'Réservation de séance sur TalentConnect !')
  end

  def booking_mentor_confirmation(appointment)
    @user = appointment.mentor
    @appointment = appointment
    @urlLogin = new_user_session_url

    mail(to: @user.email, subject: 'Demande de réservation de séance sur TalentConnect !')
  end
  
end
