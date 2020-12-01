class AppointmentController < ApplicationController
  # Before executing certain methods we find the right appointment to operate on
  before_action :set_appointment, only: [:destroy]

  def index
    @appointments = Appointment.all
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      flash[:success] = "Un nouveau rendez-vous a été enregistrée!"
      redirect_to root
    else
      flash[:danger] = "Vérifiez les informations de votre rendez-vous: #{@appointment.errors.full_messages.each {|message| message}.join('')}"
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
    params.require(:appointment).permit(:start_time, :duration, :mentor_id, :apprentice_id, :place_id, :talent_id)
  end
end
