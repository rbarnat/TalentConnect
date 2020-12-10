class ReviewsController < ApplicationController
  include ReviewsHelper
  before_action :authenticate_user!
  before_action :is_current_user_appointment?, only: [:new]
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.appointment_id = params[:appointment_id]
    @review.save
    # If review is created confirm and show it, else show new form
    if @review.save
      flash[:success] = "Bravo, ton commentaire a bien été pris en compte!"
      redirect_to talent_path(params[:talent_id])
    else
      flash.now[:danger] = "Le commentaire n'a pas été créé. tu as déjà évalué cette scéance!"
      render :new
    end
  end

  def show
  end

  private
  # Allow review attributes to pass
  def review_params
    params.permit(:appointment_id, :talent_id)
    params.require(:review).permit(:mark, :comment)
  end

end
