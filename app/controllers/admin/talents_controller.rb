class Admin::TalentsController < ApplicationController
    
    def index
        @talents = Talent.all
        @appointments = Appointment.all
        @users = User.all
    end

    def edit
        @talents = Talent.all
        @talent = Talent.find(params[:id])
    end

    def destroy
        @talent = Talent.find(params[:id])
        @talent.destroy
       redirect_to root_path ,  alert: 'Talent supprimé !'

      end
end