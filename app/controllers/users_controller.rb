class UsersController < ApplicationController
  def index
  end

  def show_results
    @users = User.where(id: params[:ids])
  end
end
