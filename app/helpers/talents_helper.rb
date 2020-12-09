module TalentsHelper
  private 
  def user_have_info?
    if current_user.first_name.nil?
      flash[:danger] = "Tu n'a pas encore renseigner ton prénom"
      redirect_to edit_user_registration_path
    end
  end

  def convert_price(price)
    price * 100
  end

  def is_current_user_talent?
    unless current_user.id == Talent.find(params[:id]).user_id
      flash[:danger] = "Tu ne peux pas éditer le talent d'une autre personne"
      redirect_to talent_path(params[:id])
    end
  end

  def global_mark(appointments)
    if appointments.length == 0 
      return "Pas encore d'évaluation"
    else
      rating = 0
      appointments.each do |appointment|
        rating += appointment.review.mark
      end
      total_rating = rating.to_d / appointments.length
      # Formating for better view
      if total_rating == total_rating.to_i
        total_rating = "#{total_rating.to_i}/5"
      else 
        total_rating = "#{'%.1f' % total_rating}/5"
      end
      return total_rating
    end
  end
end
