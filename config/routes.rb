Rails.application.routes.draw do
  root 'users#index'

  resources :users do
    collection do
      get :show_results
    end
  end

  namespace :reference do
    get 'users/search'
  end
end
