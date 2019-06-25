Rails.application.routes.draw do
  root to: "items#index"
  post 'users/registration_base' => 'users#create'
  get 'sessions/sign_in' => 'sessions#sign_in'
  post 'sessions/create' =>'sessions#create'
  delete 'sessions/destroy' => 'sessions#destroy'
  # resources :users, only: [:sign_up, :registration_base, :registration_phone, :registration_address, :registration_payment, :registration_completion, :confirmation, :registration_base, :edit, :show, :logout]
  # resources :sessions, only: [:sign_in, :create, :destroy]
  resources :credits, only: [:index, :new]
  resources :purchase, only: [:new]

  resources :users, only: [:edit, :show] do
    collection do
      delete 'log_out'
      get 'log_out_page'
      get 'sign_up'
      get 'registration_base'
      get 'registration_phone'
      get 'registration_address'
      get 'registration_payment'
      get 'registration_completion'
      get 'confirmation'
    end
  end

  resources :items, only: [:index, :new, :create, :show] do
    collection do
      get 'search'
    end
  end
  resources :categories, only: [:index, :show]
end
