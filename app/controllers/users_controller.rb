class UsersController < ApplicationController
  include TalentsHelper
  before_action :check_user
  before_action :authenticate_user!, except: [:is_user_current_user?]
  before_action :redirect_if_user_not_current_user
  

  def index
    @users = User.all
  end

  def show
    @paid_appointments = Appointment.where(apprentice_id: params[:id])
    @future_paid_appointments = @paid_appointments.where("start_time > ?", Time.now)
    @past_paid_appointments = @paid_appointments.where("start_time <= ?", Time.now)
    # @mentor_validate_appointments = @future_paid_appointments.where
    # @apprentice_validate_appointments = @future_paid_appointments.where
  end

  def apprentice_show
    @paid_appointments = Appointment.where(apprentice_id: params[:id], is_mentor_validate: true, is_paid: true)
    
    @future_paid_appointments = @paid_appointments.where("start_time > ?", Time.now)
    @past_paid_appointments = @paid_appointments.where("start_time <= ?", Time.now)
    @not_validate_appointments = Appointment.where(apprentice_id: params[:id], is_mentor_validate: false, is_paid: false)
    @not_paid_appointments = Appointment.where(apprentice_id: params[:id], is_mentor_validate: true, is_paid: false)
  end

  def mentor_show
    @paid_appointments = Appointment.where(mentor_id: params[:id], is_mentor_validate: true, is_paid: true)

    @future_paid_appointments = @paid_appointments.where("start_time > ?", Time.now)
    @past_paid_appointments = @paid_appointments.where("start_time <= ?", Time.now)
    @not_validate_appointments = Appointment.where(mentor_id: params[:id], is_mentor_validate: false, is_paid: false)
    @not_paid_appointments = Appointment.where(mentor_id: params[:id], is_mentor_validate: true, is_paid: false)
  end

  def is_user_current_user?
    if user_signed_in?
      @user = User.find(params[:id])
      return user_signed_in? && @user.id == current_user.id
    else
      return false
    end
  end

  def redirect_if_user_not_current_user
    if !is_user_current_user?
      flash[:error] = "Tu n'as pas l'autorisation de gérer ce profil."
      redirect_to root_path
    end
  end

  private 

  def check_user
    @user = User.find(params[:id])
    if current_user != @user
      redirect_to root_url, alert: "Tu ne peux pas accéder à ce profil car il ne t'appartient pas."
    end
  end

end

