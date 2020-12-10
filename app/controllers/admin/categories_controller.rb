class Admin::CategoriesController < ApplicationController

    def index
        @categories = Category.all
    end

    def create
        
    end

    def destroy 
        @categorie = Category.find(params[:id])
        @categorie.destroy
        redirect_to admin_talents_path ,  alert: 'Catégorie supprimée !'
    end
    
end