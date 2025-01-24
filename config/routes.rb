Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :tutors, only: [:index, :show, :new, :create] do
    resources :bookings
    resources :favourites, only: [:create, :update]
  end

  resources :bookings, only: [:index, :destroy]
  resources :users, only: [:edit, :update, :show]


  resources :favourites, only: [:index, :destroy, :update]
end


# resources :users, only: [:edit, :update] do
#   resources :tutors, only: [:index, :show, :new, :create] do
#    resources :bookings, only: [:index, :show, :new, :create]
#   end
# end
# resources :bookings, only: [:destroy]
# end
