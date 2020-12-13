class Admins::CategoriesController < ApplicationController

    def index
        @category = Category.all
    end

    def create
        @category = Category.new(category_params)
        if @category.save
            redirect_to admins_talents_path ,  success: 'Catégorie créée avec succés !'
        else
            redirect_to admins_talents_path , danger: 'La création de la catégorie a échouée'
        end
    end

    def destroy 
        @category = Category.find(params[:id])
        @category.destroy
        redirect_to admins_talents_path ,  success: 'Catégorie supprimée !'
    end

    private

    def category_params
        params.require(:category).permit(:title)
    end
    
end