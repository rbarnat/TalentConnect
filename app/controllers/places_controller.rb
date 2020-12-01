class PlacesController < ApplicationController
  def index
    @places = Places.all
  end

  def show
  end

  def new
    @place = Places.new
  end

  def create
    @place = Places.new(place_params)
    if @place.save
      flash[:success] = "Une nouvelle localisation a été enregistrée!"
      redirect_to root
    else
      flash[:danger] = "Vérifiez les informations de la localisation: #{@place.errors.full_messages.each {|message| message}.join('')}"
    end
    
  end

  def edit
  end

  def update
    @place = Places.find(param[:id])
    if @place.update(place_params)
      flash[:success] = "Les informations de la localisation ont été mis à jour!"
      redirect_to root
    else
      flash[:danger] = "Vérifiez les informations de la localisation: #{@place.errors.full_messages.each {|message| message}.join('')}"
    end
  end

  private

  def place_params
    params.require(:place).permit(:city_name, :zip_code, :address, :latitude, :longitude)
  end

end
