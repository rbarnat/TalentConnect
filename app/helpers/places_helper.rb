module PlacesHelper

  # find the place using the id
  def set_place(model)
    @place = Place.find(model.place_id)
  end

end
