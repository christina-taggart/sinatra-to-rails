TerseWords::Application.routes.draw do
  root to: 'pages#index'

  post '/sign_in' => 'sessions#sign_in'
  delete '/sign_out' => 'sessions#sign_out'

  resources :users do
    resources :urls
  end

  get '/:short_url_key' => 'redirects#redirect'
end
