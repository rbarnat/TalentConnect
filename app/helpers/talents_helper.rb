module TalentsHelper
  def user_have_info?
    if current_user.first_name.nil?
      flash[:danger] = "Tu n'a pas encore renseigner ton prénom"
      redirect_to edit_user_registration_path # a changer par user edit path quand cette page sera ajoutée
      end
  end

  def convert_price(price)
    price * 100
  end

  def global_mark(appointments)
    if appointments.length == 0 
      return "Pas encore d'évaluation"
    else
      rating = 0
      appointments.each do |appointment|
        rating += appointment.review.mark
      end
      return "#{'%.1f' % (rating.to_d / appointments.length)}/5"
    end
  end
end
