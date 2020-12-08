class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
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
    params.require(:review).permit(:mark, :comment, :appointment_id, :talent_id)
  end

end
