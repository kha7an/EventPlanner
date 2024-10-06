Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :events do
    resources :event_registrations, only: %i[create destroy]
  end
  get 'events/:id/modal', to: 'events#modal', as: 'event_modal'

  resources :users, only: [:show]

  resources :users do
    get 'events', to: 'events#users_events'
  end

  root "events#index"
end
