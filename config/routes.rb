Rails.application.routes.draw do
  root to: "items#index"
  post 'users/registration_base' => 'users#create_sign_up'
  post 'users/create' =>'users#create_sign_in'
  delete 'sessions/destroy' => 'sessions#destroy'

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
      get 'sign_in'
    end
  end

  resources :items, only: [:index, :new, :create, :show] do
    collection do
      get 'search'
    end
  end
  resources :categories, only: [:index, :show]
end
