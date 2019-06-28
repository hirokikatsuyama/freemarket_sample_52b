Rails.application.routes.draw do
  root to: "items#index"
  post 'users/registration_base' => 'users#create_sign_up'
  post 'users/registration_sns' => 'users#create_sns'
  post 'users/create' =>'users#create_sign_in'
  delete 'sessions/destroy' => 'sessions#destroy'


  resources :credits, only: [:new, :show,:index,:new] do
    collection do
      post 'show', to: 'credits#show'
      post 'pay', to: 'credits#pay'
      post 'delete', to: 'credits#delete'
    end
  end

   resources :purchase, only: [:new] do
    collection do
      get 'index', to: 'purchase#index'
      post 'pay', to: 'purchase#pay'
      get 'done', to: 'purchase#done'
    end
  end



 
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
      get 'registration_sns'
    end
  end

  get 'auth/:provider/callback', to: 'users#registration_sns'
  get 'auth/failure', to: 'users#sign_in'

  resources :items, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    collection do
      get 'search'
    end
  end
  resources :categories, only: [:index, :show]
end
