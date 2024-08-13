Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  resources :events do
    resources :event_registrations, only: %i[create destroy]
  end

  root "events#index"
end
