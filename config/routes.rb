Rails.application.routes.draw do
  get 'rooms/index'
  get 'rooms/new'
  root 'rooms#home'
  devise_for :users 
  get 'users/account'
  get 'users/profile'
  get 'users/mypage'
  resources :users
  resources :rooms do
    collection do
      get 'hotellist'
    end
  end
  resources :rooms
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
