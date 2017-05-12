Rails.application.routes.draw do
  root to: 'root#index'

  resources :photographs do
    collection do
      get :portfolio
    end
  end

  resources :albums
end
