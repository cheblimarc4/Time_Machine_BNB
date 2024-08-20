Rails.application.routes.draw do
  devise_for :users
  root "pages#home"
  get "time_machines/mine", to: "time_machines#mine"
  resources :time_machines, only: [:new, :create, :index, :show] do
    resources :bookings, only: [:new]
  end
end
