Rails.application.routes.draw do
  root 'tasks#index'
  resources :tasks do
    member do
      get :endtime
      get :comment
      post :write
      put :overwrite
    end
  end

  patch "/tasks/:id/write" => "tasks#write"
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show] do
    collection do
      get :admin
    end
  end

end