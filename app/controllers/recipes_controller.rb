class RecipesController < ApplicationController
  # Get /recipes
  def index
    @recipe = Recipe.all
  end

  # get/recipes/:recipe_id
  def show
    @recipe = Recipe.find(params[:id])
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

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :public, :description)
  end
  private :recipe_params
end
