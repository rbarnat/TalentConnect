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
    @reviewed_appointments = Appointment.where(talent_id: set_talent).joins(:review)

    # AGENDA
    @duration_hour = (set_talent.duration / 60).round
    paid_appointments_as_mentor = Appointment.where(mentor_id: set_talent.user_id, is_mentor_validate: true, is_paid: true) 
    mentor_validate_appointments_as_mentor = Appointment.where(mentor_id: set_talent.user_id, is_mentor_validate: true, is_paid: false)
    paid_appointments_as_apprentice = Appointment.where(apprentice_id: set_talent.user_id, is_mentor_validate: true, is_paid: true)
    mentor_validate_appointments_as_apprentice = Appointment.where(apprentice_id: set_talent.user_id, is_mentor_validate: true, is_paid: false)
    @user_agenda = paid_appointments_as_mentor || mentor_validate_appointments_as_mentor || paid_appointments_as_apprentice || mentor_validate_appointments_as_apprentice
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
    redirect_to mentor_show_user_url(@talent.user_id)
  end

  private
  # Convert duration in hours to minutes before allowing talent attributes to pass
  def talent_params
    hours = params[:talent][:duration].to_d
    minutes = hours * 60
    params[:talent][:duration] = minutes
    params.require(:talent).permit(:title, :description, :duration, :picture, :price)
  end
  # Allow place nested form attribute to pass
  def place_params
    params.require(:place).permit(:address, :zip_code, :city_name, :longitude, :latitude)
  end

  # find the talent using the id
  def set_talent
    @talent = Talent.find(params[:id])
  end
end
