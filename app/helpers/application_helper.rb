module ApplicationHelper
  private
  def is_current_user_admin?
    if user_signed_in?
      current_user.is_admin?
    end
  end

  def get_cities_name
    cities_names_array = []
    Place.all.each do |place|
      unless cities_names_array.include?(place.city_name) || place.city_name == "Ville non renseignée"
        cities_names_array << place.city_name
      end
    end
    return cities_names_array
  end
end
