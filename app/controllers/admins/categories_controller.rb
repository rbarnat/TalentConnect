class Admins::CategoriesController < ApplicationController
    include AdminsHelper
    before_action :authenticate_user!
    before_action :redirect_if_not_admin, only: [:index, :create, :destroy]

    def index
        @categories = Category.all.order(:id)
    end

    def create
        @category = Category.new(category_params)
        if @category.save
            flash[:success] = "La catégorie a bien été créée !"
            redirect_to admins_categories_path
        else
            flash.now[:danger] = "La catégorie n'a pas été créée."
            render :new
        end
    end

    def destroy 
        @category = Category.find(params[:id])
        @category.destroy
        redirect_to admins_categories_path ,  success: 'La catégorie a bien été supprimée !'
    end

    def category_params
        params.permit(:title)
    end
    
end