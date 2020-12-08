class AppointmentsController < ApplicationController
  # Before executing certain methods we find the right appointment to operate on
  before_action :set_appointment, only: [:show, :destroy, :update]
  before_action :authenticate_user!

  def index
    @appointments = Appointment.all
  end

  def show
    @talent = Talent.find(@appointment.talent_id)
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @talent = Talent.find(params[:talent_id])
    @appointment = Appointment.new(appointment_params)
    @appointment.talent_id = @talent.id
    @appointment.apprentice_id = current_user.id
    @appointment.mentor_id = @talent.user_id
    @appointment.place_id = @talent.place_id
    if @appointment.save
      flash[:success] = "La séance a bien été proposée au mentor !"
      redirect_to talent_path(@talent)
    else
      flash.now[:danger] = "La séance n'a pas été créée."
      render :new
    end
  end
  
  def update
    @appointment.update(appointment_params_update)
    redirect_to mentor_show_user_path(current_user.id)
  end

  def destroy
    @appointment.destroy
    redirect_to mentor_show_user_path(current_user.id)
  end
  
  private
  # find the appointment using the id
  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  # let throught and define the Appointement params that were sent from the view
  def appointment_params
    params.require(:appointment).permit(:start_time, :is_mentor_validate)
  end

  def appointment_params_update
    params.permit(:is_mentor_validate)
  end
end
