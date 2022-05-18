class FoodsController < ApplicationController
  def show
    @foods = Food.all
  end

  def create
    @foods = Food.new
  end

  def delete
      Food.find(params[:id]).destroy
      redirect_to :action => 'show'
  end
end
