Rails.application.routes.draw do

  #devise_for :users
  scope format: false do
    resources :organizations, constraints: { id: /.+/ }
  end
  resources :volunteers
  resources :event_dates
  resources :opportunities
  resources :skills
  resources :forms
  resources :categories
  resources :events
  resources :users #Where is the list of users?
  resources :sessions, only: [:create, :new, :destroy]
  resources :tree_bits
  resources :opportunities do
    put :favorite, on: :member
  end

# routes the root directory to the homepage
  root 'welcome#welcome'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/signup', to:'users#new'
  delete '/logout', to:'sessions#destroy'
  get '/orgsignup', to:'users#new_org'
  get '/dashboard', to:'organizations#dashboard', :as => :dashboard_path
  get '/treebits', controller: 'tree_bits_controller', action:'index'
end
