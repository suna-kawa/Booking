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
  get 'reservations/index'
  resources :reservations do
    member do
    post 'confirm', as: 'confirm'
    end
  end
end
