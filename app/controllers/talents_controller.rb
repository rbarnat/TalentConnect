class TalentsController < ApplicationController
  include TalentsHelper
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :user_have_info, only: [:new, :edit]

  def index
    @talents = Talent.all
  end

  def search_results
    keywords = params[:search_keywords]
    @found_talents = Talent.roughly_spelled_like(keywords)
    
  end

  def show
    @talent = Talent.find(params[:id])
  end

  def new
    @talent = Talent.new
  end

  def edit
    @talent = Talent.find(params[:id])
  end

  def create
    @place = Place.create(place_params)
    @talent = Talent.new(talent_params)
    @talent.user_id = current_user.id
    @talent.place_id = @place.id
    @talent.save
    redirect_to talent_path(@talent.id)
  end

  def update
    @talent = Talent.find(params[:id])
    @talent.update(talent_params)
    redirect_to talents_path
  end

  def destroy
    @talent = Talent.find(params[:id])
    @talent.destroy
    redirect_to talents_path
  end

  private
  # Allow talent attribute to pass
  def talent_params
    params.require(:talent).permit(:title, :description, :duration, :picture)
  end
  # Allow place nested form attribute to pass
  def place_params
    params.require(:place).permit(:address, :zip_code, :city_name)
  end

end
