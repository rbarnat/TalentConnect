module AppointmentHelper
  private
  def is_user_both_apprentice_and_mentor?
    @talent = Talent.find_by(id: params[:talent_id])
    if @talent.nil?
      # flash[:danger] = "Tu ne peux pas créer une scéance pour un talent inexistant"
      # redirect_to root_path
      puts "BUG TO FIX"
    else
      unless current_user.id != @talent.user_id
        flash[:danger] = "Tu ne peux pas créer un rendez-vous avec toi même!"
        redirect_to root_path
      end
    end
  end
end
