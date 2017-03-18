Rails.application.routes.draw do
  resources :photographs do
    collection do
      get :portfolio
    end
  end

  resources :albums
end
