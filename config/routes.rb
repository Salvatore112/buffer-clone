Rails.application.routes.draw do
  get 'up' => 'rails/health#show', as: :rails_health_check
  get 'about-us', to: 'about#index', as: :about

  get 'password', to: 'passwords#edit', as: :edit_password
  patch 'password', to: 'passwords#update'

  get 'password/reset', to: 'password_resets#new'
  post 'password/reset', to: 'password_resets#create'

  get 'sign-up', to: 'registrations#new'
  post 'sign-up', to: 'registrations#create'

  get 'sign-in', to: 'sessions#new'
  post 'sign-in', to: 'sessions#create'

  delete 'logout', to: 'sessions#destroy'
  root to: 'main#index'
end
