Rails.application.routes.draw do
  get 'tutors/index'
  devise_for :users
  root to: "pages#home"


  resources :tutors, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:index, :show, :new, :create]
  end
  resources :bookings, only: [:destroy]
  resources :users, only: [:edit, :update]
end

# resources :users, only: [:edit, :update] do
#   resources :tutors, only: [:index, :show, :new, :create] do
#    resources :bookings, only: [:index, :show, :new, :create]
#   end
# end
# resources :bookings, only: [:destroy]
# end
