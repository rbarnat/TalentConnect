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

  def convert_date_in_datetime(date, hour)
    date_string = date.strftime("%d/%m/%Y")
    time_string = ""
    time_string = "0#{hour}:00:00" if hour < 10
    time_string = "#{hour}:00:00" if hour >= 10
    datetime_string = date_string + " " + time_string
    datetime_string.to_datetime
    # DateTime.new(date.year, date.month, date.day, hour,0,0,'+0')
  end

  def convert_date_in_datetime_ok?(date, hour)
    begin
      # do something dodgy
      convert_date_in_datetime(date, hour)
    rescue ActiveRecord::RecordNotFound
      # handle not found error
      return false
    rescue ActiveRecord::ActiveRecordError
      # handle other ActiveRecord errors
      return false
    rescue # StandardError
      # handle most other errors
      return false
    rescue Exception
      # handle everything else
      return false
      raise
    end
    return true

  end
end
