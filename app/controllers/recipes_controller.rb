class RecipesController < ApplicationController
  # Get /recipes
  def index
    @recipe = current_user.recipes
  end

  # get/recipes/:recipe_id
  def show
    @recipe = Recipe.find(params[:id])
    # @recipe = current_user.recipes.includes(:recipes).find(params[:id])
  end

  # get/recipes/new
  def new
    @recipe = Recipe.new
  end

  # post/recipes
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user

    if @recipe.save
      redirect_to recipes_path(id: @recipe.user_id)
      flash[:notice] = 'Recipe added successfully!'
    else
      render :new
      flash[:alert] = 'Recipe not added'
    end
  end

  def public_recipe
    @public_recipes = Recipe.where('public = true').order(id: :desc).includes(:food).includes(:user)
  end

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :public, :description)
  end
  private :recipe_params
end
