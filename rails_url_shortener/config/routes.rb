RailsUrlShortener::Application.routes.draw do
  root :to => 'urls#index'
  get '/:short_url' => 'urls#long_url'
  resources :urls, :only => [:index, :new, :create, :show]
end
