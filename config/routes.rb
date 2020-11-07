Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  devise_scope :user do
    # if I use users/registrations#new I get a too many redirections error
    root to: 'users/sessions#new'
  end

  resources :users, only: :show
  resources :tweets, only: %i[new create]

  namespace :users do
    get 'followings/index'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
