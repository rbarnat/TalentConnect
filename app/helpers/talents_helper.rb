module TalentsHelper
  def user_have_info?
    if current_user.first_name.nil?
      flash[:danger] = "Tu n'a pas encore reseigner ton prénom"
      redirect_to root_path
      end
  end
end
