class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def show
    @foods = Food.find(params[:id])
  end

  def new
    @foods = Food.new
  end

  def create
    @foods = Food.new(food_params)
    @foods.user = current_user

    if @foods.save
      redirect_to foods_path
      flash[:notice] = 'Food added successfully!'
    else
      render :new
      flash[:alert] = 'Food not added'
    end
  end

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
  private :food_params
end
