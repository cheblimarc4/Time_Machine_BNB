Rails.application.routes.draw do
  devise_for :users
  root "time_machines#new"
  resources :time_machines, only: [:new, :create]
end
