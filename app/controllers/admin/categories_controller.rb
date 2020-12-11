class Admin::CategoriesController < ApplicationController

    def index
        @category = Category.all
    end

    def create
        @category = Category.new(category_params)
        @category.save
        if @category.save
            redirect_to admin_talents_path ,  alert: 'Catégorie créée avec succés !'
        else
            redirect_to admin_talents_path , alert: 'La création de la catégorie a échouée'
        end

    end

    def destroy 
        @category = Category.find(params[:id])
        @category.destroy
        redirect_to admin_talents_path ,  alert: 'Catégorie supprimée !'
    end

    private

    def category_params
        params.require(:title)
    end
    
end