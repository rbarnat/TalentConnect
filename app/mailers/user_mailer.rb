class UserMailer < ApplicationMailer
default from: 'contact.talentconnect100@gmail.com'

  def welcome_email(user)
    @user = user
    @urlHomePage = root_url
    @urlLogin = new_user_session_url
    
    mail(to: @user.email, subject: 'Bienvenue au sein de la communauté TalentConnect !')
  end

  def booking_user_confirmation(appointment)
    @user = appointment.apprentice
    @appointment = appointment
    @urlLogin = new_user_session_url

    mail(to: @user.email, subject: 'Demande de réservation de séance sur TalentConnect !')
  end

  def booking_mentor_confirmation(appointment)
    @user = appointment.mentor
    @appointment = appointment
    @urlLogin = new_user_session_url

    mail(to: @user.email, subject: 'Demande de réservation de séance sur TalentConnect !')
  end

  def payment_apprentice_confirmation(appointment)
    @user = appointment.apprentice
    @appointment = appointment
    @urlLogin = new_user_session_url
    @amount = appointment.talent.price
    mail(to: @user.email, subject: 'Confirmation de paiement pour séance sur TalentConnect !')
  end

  def payment_mentor_confirmation(appointment)
    @user = appointment.mentor
    @appointment = appointment
    @urlLogin = new_user_session_url
    @amount = appointment.talent.price
    mail(to: @user.email, subject: 'Confirmation de paiement pour séance sur TalentConnect !')
  end

  def validation_by_mentor_confirmation(appointment)
    @user = appointment.apprentice
    @appointment = appointment
    @urlLogin = new_user_session_url
    @amount = appointment.talent.price
    mail(to: @user.email, subject: 'Confirmation de validation de séance par mentor sur TalentConnect !')
  end

  def appointment_rejected_confirmation(appointment)
    @user = appointment.apprentice
    @appointment = appointment
    @urlLogin = new_user_session_url
    mail(to: @user.email, subject: 'Demande de réservation de séance rejetée par mentor sur TalentConnect !')
  end

end
