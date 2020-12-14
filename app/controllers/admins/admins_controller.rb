class Admins::AdminsController < ApplicationController
  include AdminsHelper
  before_action :authenticate_user!
  before_action :redirect_if_not_admin, only: [:show]

  def show
    @talents = Talent.all
    @appointments = Appointment.all
    @users = User.all
    @categories = Category.all
    @category = Category.new
  end
end