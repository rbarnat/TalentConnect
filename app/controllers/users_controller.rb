class UsersController < ApplicationController
  before_action :check_user
 
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def check_user
    if current_user != @user
      redirect_to root_url, alert: "Tu ne peux pas voir ce profil, il appartient à quelqu'un d'autre."
    end
  end
end

