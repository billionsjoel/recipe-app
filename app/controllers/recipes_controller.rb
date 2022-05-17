class RecipesController < ApplicationController
  def index
    @recipe = Recipe.all
    #fix n+1 issue
    # @user = User.includes(:recipes.find(params[:user_id])
    # @posts = @user.recipes
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(post_params)
    @recipe.user = current_user

    if @recipe.save
      redirect_to user_path(id: @recipe.user_id)
      flash[:notice] = 'Recipe added successfully!'
    else
      render :new
      flash[:alert] = 'Post not submitted'
    end

  end


  def recipe_params
    params.require(:post).permit(:title, :text)
  end
  private :recipe_params
end
