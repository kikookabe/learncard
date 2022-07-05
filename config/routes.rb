Rails.application.routes.draw do
  resources :tasks do
    member do
      get :endtime
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
end