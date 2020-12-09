module ReviewsHelper

  def is_current_user_appointment?
    @appointment = Appointment.find_by(id: params[:appointment_id])
    if @appointment.nil?
      flash[:danger] = "Tu ne peux pas créer un commentaire pour une scéance inexistante"
      redirect_to root_path
    else
      unless current_user.id == @appointment.apprentice_id
        flash[:danger] = "Tu ne peux pas créer un commentaire à la place d'une autre personne"
        redirect_to root_path
      end
    end
  end
end
