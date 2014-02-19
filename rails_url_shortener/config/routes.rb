RailsUrlShortener::Application.routes.draw do
  root :to => 'urls#index'
  get '/:short_url' => 'urls#show'
  resources :urls, :only => [:new, :create, :show]

end
