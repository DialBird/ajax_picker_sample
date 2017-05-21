class Reference::UsersController < ApplicationController
  def search
    @search = Search::User.new(search_params)
    @users = @search.matches.page(params[:page]).per(5)
    render partial: 'shared/users/list', layout: false
  end

  private

  def search_params
    params.require(:search_user).permit(Search::User::ATTRIBUTES)
  end
end
