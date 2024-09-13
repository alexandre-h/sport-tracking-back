Rails.application.routes.draw do
  post 'auth/check_token', to: 'auth#check_token'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'registrations'
  }

  resources :seances
  resources :seance_templates
end
