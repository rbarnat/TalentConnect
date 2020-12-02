class StaticPagesController < ApplicationController
  def home
    @talents = Talent.all
  end

  def about
  end

  def contact
  end
end
