class Admins::AdminsController < ApplicationController
    
  def show
    @talents = Talent.all
    @appointments = Appointment.all
    @users = User.all
    @categories = Category.all
    @category = Category.new
  end
end