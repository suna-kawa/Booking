Rails.application.routes.draw do
  root 'users#index'
  devise_for :users 
  get 'users/account'
  get 'users/profile'
  get 'users/mypage'
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
