class TalentsController < ApplicationController
  # Before starting anything import helper and do do some checks
  include TalentsHelper, PlacesHelper
  before_action :authenticate_user!, :user_have_info?, only: [:new, :edit]
  before_action :set_talent, only: [:show, :edit, :update, :destroy] 
  # Call a helper with an arguement in it
  before_action only: [:edit, :update] do 
    set_place(set_talent)
  end

  def index
    @talents = Talent.all
  end

  def search_results
    keywords = params[:search_keywords]
    @found_talents = Talent.roughly_spelled_like(keywords)
  end

  def show
    
  end

  def new
    @talent = Talent.new
  end

  def edit

  end

  def create
    @place = Place.create(place_params)
    @talent = Talent.new(talent_params)
    @talent.user_id = current_user.id
    @talent.place_id = @place.id
    @talent.save
    # If talent is created confirm and show it, else show new form
    if @talent.save
      flash[:success] = "Bravo, tu as créé un nouveau talent!"
      redirect_to talent_path(@talent)
    else
      flash.now[:danger] = "Le talent n'a pas été créé."
      render :new
    end
  end

  def update
    @place.update(place_params)
    if @talent.update(talent_params)
      flash[:success] = "Tu as mis à jour les informations de ton talent"
      redirect_to talent_path(@talent)
    else
      flash.now[:danger] = "Le talent n'a pas été mis à jour."
      render :edit
    end
  end

  def destroy
    @talent.destroy
    redirect_to talents_path
  end

  private
  # Convert duration in hours to minutes before allowing talent attributes to pass
  def talent_params
    hours = params[:talent][:duration].to_d
    minutes = hours * 60
    params[:talent][:duration] = minutes
    params.require(:talent).permit(:title, :description, :duration, :picture)
  end
  # Allow place nested form attribute to pass
  def place_params
    params.require(:place).permit(:address, :zip_code, :city_name)
  end

  # find the talent using the id
  def set_talent
    @talent = Talent.find(params[:id])
  end
end
