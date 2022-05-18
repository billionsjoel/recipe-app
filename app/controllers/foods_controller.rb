class FoodsController < ApplicationController
  def show
    @foods = Food.all
  end

  def delete
      Food.find(params[:id]).destroy
      redirect_to :action => 'show'
  end
end
