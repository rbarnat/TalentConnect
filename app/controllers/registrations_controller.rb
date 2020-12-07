class RegistrationsController < Devise::RegistrationsController
  # Before edit and update get the place linked to user so we can modify it too
  before_action :set_place, only: [:edit, :update]
  protected

  def update_resource(resource, params)
    # Require current password if user is trying to change password.
    return super if params["password"]&.present?
    # Allows user to update registration information without password.
    resource.update_without_password(params.except("current_password"))
    # Update the place using the nested form attributes
    @place.update(create_place_params)
  end

  private 
  # Get the place linked to current user
  def set_place
    @place = Place.find(current_user.place_id)
  end
  # Get the nested place params in a separate hash
  def create_place_params
    params.require(:user).require(:place).permit(:address, :zip_code, :city_name)
  end

end