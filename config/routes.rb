Rails.application.routes.draw do
  resources :movies do
  	collection do
  	  get '/rent_a_movie', to: 'movies#make_a_rent'
  	  post '/finalize_rent', to: 'movies#finalize_rent'
  	end
  end
  devise_for :users, path: "", path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'new' }
  resources :users
  root to: 'movies#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
