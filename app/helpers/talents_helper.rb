module TalentsHelper
  private 

  def convert_price(price)
    price * 100
  end

  def is_current_user_talent?
    unless current_user.id == Talent.find(params[:id]).user_id
      flash[:danger] = "Tu ne peux pas éditer le talent d'une autre personne."
      redirect_to talent_path(params[:id])
    end
  end

  def global_mark(appointments)
    if appointments.length == 0 
      return "Pas encore d'évaluation."
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

  def filter_talents(talent_array)
    category_choice = search_category_params[:category_id]
    city_choice = search_category_params[:city_name]

    if category_choice.blank? && city_choice.blank?
      return talent_array

    elsif category_choice.blank? 
      @filtred_talents = []
      talent_array.each do |talent|
        if talent.place.city_name == city_choice
          @filtred_talents << talent
        end
      end
    elsif city_choice.blank?
      @filtred_talents = []
      talent_array.each do |talent|
        if talent.categories.ids.include?(category_choice.to_i)
          @filtred_talents << talent
        end
      end
    else
      @filtred_talents = []
      talent_array.each do |talent|
        if talent.categories.ids.include?(category_choice.to_i) && talent.place.city_name == city_choice
          @filtred_talents << talent
        end
      end
    end
    return @filtred_talents
  end
end
