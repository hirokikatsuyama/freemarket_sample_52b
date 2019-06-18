Rails.application.routes.draw do
  root to: "items#index"
  get 'credit/new'
  get 'credit/index'
  get 'users/edit'
  get 'users/show'
  get 'users/logout'
  get 'purchase/new'
  get 'items/index'
  get 'items/new'
  get 'items/show'
  devise_for :views
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'users/registration_base' => 'users#registration_base'
  get 'users/registration_phone' => 'users#registration_phone'
  get 'users/registration_address' => 'users#registration_address'
  get 'users/registration_payment' => 'users#registration_payment'
  get 'users/registration_completion' => 'users#registration_completion'

end
