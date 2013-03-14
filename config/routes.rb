Goldfinchjewellery::Application.routes.draw do
  resources :sessions
  get '/sign_in' => 'sessions#new'
  get 'admin' => 'pages#admin'
  resources :news
  resources :galleries, only: [:index, :show]
  root to: 'pages#about'
  get '/contact' => 'pages#contact'
  get '/links'   => 'pages#links'
end
