Rails.application.routes.draw do
  devise_for :users
  root to: 'prototypeses#index'

  resources :prototypeses

end
