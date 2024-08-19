Rails.application.routes.draw do
  devise_for :users
  root "/"
  resources :time_machines, only: [:new, :create]
end
