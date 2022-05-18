class FoodsController < ApplicationController
  def show
    @foods = Food.all
  end
end
