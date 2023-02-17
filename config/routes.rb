Rails.application.routes.draw do
  get 'health/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  jsonapi_resources :spots
  jsonapi_resources :reviews
end
