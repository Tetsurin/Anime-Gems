Rails.application.routes.draw do
  resources :animes
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get '/search', to: 'animes#search'
  get "/anime_posters", to: 'animes#_anime_posters'
  root to: "home_page#index"
  # Defines the root path route ("/")
  # root "posts#index"
end
