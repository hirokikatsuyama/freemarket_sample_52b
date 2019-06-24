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
  # resources :users, only: [:sign_up, :registration_base, :registration_phone, :registration_address, :registration_payment, :registration_completion, :confirmation, :registration_base, :edit, :show, :logout]
  # resources :sessions, only: [:sign_in, :create, :destroy]
  resources :credits, only: [:index, :new]
  resources :purchase, only: [:new]
  resources :items, only: [:index, :new, :create, :show] do
    collection do
      get 'search'
    end
  end
  resources :categories, only: [:index, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



end
