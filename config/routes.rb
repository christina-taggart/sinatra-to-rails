AndyList::Application.routes.draw do
  root to: 'categories#index'

  resources :categories do
    resources :posts
  end

  get '/:key', to: 'users#edit_post'

end
