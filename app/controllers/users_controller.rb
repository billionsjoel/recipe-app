class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
    @user = User.includes(:recipes).find(params[:id])
  end
end
