class Admins::TalentsController < ApplicationController
    include AdminsHelper
    before_action :authenticate_user!
    before_action :redirect_if_not_admin, only: [:index, :edit, :destroy]

    def index
        @talents = Talent.all.order(:id)
    end

    def edit
        @talent = Talent.find(params[:id])
    end

    def destroy
        @talent = Talent.find(params[:id])
        @talent.destroy
        redirect_to admins_talents_path ,  success: 'Le talent a bien été supprimé !'
    end
end