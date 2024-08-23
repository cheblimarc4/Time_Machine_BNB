Rails.application.routes.draw do
  devise_for :users
  root "pages#home"
  get "/home", to: "pages#home"
  get "time_machines/mine", to: "time_machines#mine"
  get "bookings/mine", to: "bookings#mine"
  resources :time_machines, only: [:new, :create, :index, :show] do
    resources :bookings, only: [:new, :create, :destroy]
  end
end
