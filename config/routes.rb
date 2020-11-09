Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  devise_scope :user do
    # if I use users/registrations#new I get a too many redirections error
    root to: 'users/sessions#new'
  end

  resources :users, only: :show do
    get 'followings/index', to: 'users/followings#index'
    get 'followers/index', to: 'users/followers#index'
  end
  resources :users, only: :index
  resources :tweets, only: %i[new create]
  resources :relationships, only: :create

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
