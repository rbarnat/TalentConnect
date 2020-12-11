module AppointmentHelper
  private
  def is_user_both_apprentice_and_mentor?
    @talent = Talent.find_by(id: params[:talent_id])
    if @talent.nil?
      # flash[:danger] = "Tu ne peux pas créer une scéance pour un talent inexistant"
      # redirect_to root_path
      puts "BUG TO FIX"
    else
      if user_signed_in?
        unless current_user.id != @talent.user_id
          flash[:danger] = "Tu ne peux pas créer un rendez-vous avec toi même!"
          redirect_to root_path
        end
      end
    end
  end

  def user_have_info?
    if current_user.first_name.nil?
      flash[:alert] = "Pour utiliser cette fonctionalité, tu dois renseigner au moins ton prénom."
      redirect_to edit_user_registration_path
    end
  end
end
