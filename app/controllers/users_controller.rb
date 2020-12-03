class UsersController < ApplicationController
<<<<<<< HEAD
  before_action :check_user
 
=======
  before_action :authenticate_user!, only: [:show, :index]
  before_action :redirect_if_user_not_current_user

>>>>>>> cc280034ebd2f2e20b45abaf43883749ff1f3b53
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

<<<<<<< HEAD
  private
  
  def check_user
    @user = User.find(params[:id])  
   
    if current_user != @user 
      redirect_to root_url, alert: "Tu ne peux pas voir ce profil, il appartient à quelqu'un d'autre."
    end
  end
=======
  def is_user_current_user?
    if user_signed_in?
      @user = User.find(params[:id])
      return user_signed_in? && @user.id == current_user.id
    else
      return false
    end
  end

  def redirect_if_user_not_current_user
    if !is_user_current_user?
      flash[:error] = "Tu n'as pas l'autisation de gérer ce profil."
      redirect_to root_path
    end
  end

>>>>>>> cc280034ebd2f2e20b45abaf43883749ff1f3b53
end

