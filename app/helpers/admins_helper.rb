module AdminsHelper
  private  
  def redirect_if_not_admin
    unless is_current_user_admin?
      flash[:danger] = "Tu n'a pas l'autorisation de te rendre sur cette page."
      redirect_to root_path
    end
  end

  def is_current_user_admin?
    if user_signed_in?
      current_user.is_admin?
    end
  end
end