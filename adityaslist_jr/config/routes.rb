AdityaslistJr::Application.routes.draw do
  root to: 'categories#index'

  resources :categories, only: [:show]
end
