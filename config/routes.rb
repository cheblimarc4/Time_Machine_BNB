Rails.application.routes.draw do
  devise_for :users
  root "time_machines#index"
  resources :time_machines, only: [:new, :create, :index, :show]
end
