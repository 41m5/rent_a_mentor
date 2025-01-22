Rails.application.routes.draw do
  get 'tutors/index'
  devise_for :users
  root to: "pages#home"

  resources :tutors, only: [:index, :show, :new, :create]
  resources :users, only: [:edit, :update]
end
