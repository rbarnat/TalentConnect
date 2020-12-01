class PicturesController < ApplicationController
  def create
    @talent = Talent.find(params[:talent_id])
    @talent.picture.attach(params[:picture])
    redirect_to(edit_talent_path(@talent))
  end
end
