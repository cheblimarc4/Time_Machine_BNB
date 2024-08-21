Rails.application.routes.draw do
  devise_for :users
  root "time_machines#index"
  get "time_machines/mine", to: "time_machines#mine"
  resources :time_machines, only: [:new, :create, :index, :show] do
    resources :bookings, only: [:new, :create]
  end
end
