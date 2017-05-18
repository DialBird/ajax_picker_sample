class UsersController < ApplicationController
  def index
    @search = Search::User.new
  end

  def search
    @search = Search::User.new(search_params)
    @users = @search.matches
    render partial: 'users/list', layout: false
  end

  private

  def search_params
    params.require(:search_user).permit(Search::User::ATTRIBUTES)
  end
end
