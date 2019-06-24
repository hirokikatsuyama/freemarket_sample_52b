Rails.application.routes.draw do
  root to: "items#index"
  get 'users/sign_up' => 'users#sign_up'
  get 'users/registration_base' => 'users#registration_base'
  get 'users/registration_phone' => 'users#registration_phone'
  get 'users/registration_address' => 'users#registration_address'
  get 'users/registration_payment' => 'users#registration_payment'
  get 'users/registration_completion' => 'users#registration_completion'
  get 'users/confirmation' => 'users#confirmation'

  post 'users/registration_base' => 'users#create'
  get 'sessions/sign_in' => 'sessions#sign_in'
  post 'sessions/create' =>'sessions#create'
  delete 'sessions/destroy' => 'sessions#destroy'
  get 'users/edit'
  get 'users/show'
  get 'users/logout'

  get 'credit/new'
  get 'credit/index'
  get 'purchase/new'


  resources :items, only: [:index, :new, :create, :show] do
    collection do
      get 'search'
    end
  end

  # get 'items/index' => 'items#index'
  # get 'items/new' => 'items#new'

  # get 'items/search', to: 'items#search'
  # post 'items' => 'items#create'

  # get 'items/show'

  resources :categories, only: [:index, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



end
