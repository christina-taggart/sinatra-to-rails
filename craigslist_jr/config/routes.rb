CraigslistJr::Application.routes.draw do


  root to: "categories#index"

  resources :categories do
    resources :posts
  end

  resources :posts, only: [] do
    resources :replies, only: [:new]
  end

  get '/categories/:category_id/posts/:id/:secret_url', to: 'posts#edit'
end
