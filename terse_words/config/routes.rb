TerseWords::Application.routes.draw do
  root to: 'pages#index'

  post '/sign_in' => 'sessions#sign_in'

  resources :users do
    resources :urls
  end

  get '/:short_url_key' => 'redirects#redirect'
end
