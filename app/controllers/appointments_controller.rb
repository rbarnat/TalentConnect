class AppointmentsController < ApplicationController
  # Before executing certain methods we find the right appointment to operate on
  before_action :set_appointment, only: [:destroy]
  before_action :authenticate_user!

  def index
    @appointments = Appointment.all
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
  
  def destroy
    @appointment.destroy
  end

  private
  # find the appointment using the id
  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  # let throught and define the Appointement params that were sent from the view
  def appointment_params
    params.require(:appointment).permit(:start_time)
  end
end
