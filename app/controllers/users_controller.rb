class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :index]
  before_action :redirect_if_user_not_current_user

  def index
    @users = User.all
  end

  def mentor_show
    @paid_appointments = Appointment.where(mentor_id: params[:id])
    @future_paid_appointments = @paid_appointments.where("start_time > ?", Time.now)
  end

  def show
    @user = User.find(params[:id])
    @paid_appointments = Appointment.where(apprentice_id: params[:id])
    @future_paid_appointments = @paid_appointments.where("start_time > ?", Time.now)
    @past_paid_appointments = @paid_appointments.where("start_time <= ?", Time.now)
    # @mentor_validate_appointments = @future_paid_appointments.where
    # @apprentice_validate_appointments = @future_paid_appointments.where
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
      flash[:error] = "Tu n'as pas l'autisation de gérer ce profil."
      redirect_to root_path
    end
  end

end

