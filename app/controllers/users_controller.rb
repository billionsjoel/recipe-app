# rubocop: disable Style/EmptyMethod
class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
  end
end
# rubocop: enable Style/EmptyMethod
