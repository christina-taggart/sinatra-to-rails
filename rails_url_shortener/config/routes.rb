RailsUrlShortener::Application.routes.draw do
  root :to => 'urls#index'
  get '/:id' => 'urls#show'
  resources :urls, :only => [:index, :new, :create, :show]
end
