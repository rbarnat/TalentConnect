class PlacesController < ApplicationController
  # Before executing certain methods we find the right place to operate on
  before_action :set_place, only: [:edit, :update]
  
  def index
    @places = Place.all
  end

  def show
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
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
    @place = Place.find(param[:id])
    if @place.update(place_params)
      flash[:success] = "Les informations de la localisation ont été mis à jour!"
      redirect_to root
    else
      flash[:danger] = "Vérifiez les informations de la localisation: #{@place.errors.full_messages.each {|message| message}.join('')}"
    end
  end

  private
  # find the Place using the id
  def place_params
    params.require(:place).permit(:city_name, :zip_code, :address, :latitude, :longitude)
  end

  # let throught and define the Place params that were sent from the view
  def set_place
    @place = Place.find(params[:id])
  end
end
