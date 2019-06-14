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
end
