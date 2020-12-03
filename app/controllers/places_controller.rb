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
      flash[:success] = "Un nouveau lieu a été créé !"
      redirect_to root_path
    else
      flash.now[:danger] = "Le lieu n'a pas été créée."
      render :new
    end
    
  end

  def edit
  end

  def update
    @place = Place.find(param[:id])
    if @place.update(place_params)
      flash[:success] = "Le lieu a été mis à jour !"
      redirect_to talent_path(@talent)
    else
      flash.now[:danger] = "Le lieu n'a pas été mis à jour."
      render :new
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
