Rails.application.routes.draw do

  resources :books
  resources :responses, only: [:create, :index]
  resources :clues
  get 'password_resets/new'

  get 'password_resets/edit'

  root 'static_pages#home'

  get  '/help',    to: 'static_pages#help'

  get  '/about',   to: 'static_pages#about'

  get  '/contact', to: 'static_pages#contact'

  get  '/signup',  to: 'users#new'

  post '/signup',  to: 'users#create'

  post '/join_team',    to: 'users#join_team'  

  get  '/login',   to: 'sessions#new'

  post '/login',   to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'

  resources :users

  resources :account_activations, only: [:edit]

  resources :password_resets, only:[:new, :create, :edit, :update]

  resources :microposts,  only: [:create, :destroy]

  resources :teams, only: [:create, :destroy]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
