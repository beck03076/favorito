Rails.application.routes.draw do
  # post '/searches' => 'search#perform', as: :searches
  resources :searches
  root to: "searches#index"
end
