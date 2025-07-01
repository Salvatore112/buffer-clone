Rails.application.routes.draw do
  get 'up' => 'rails/health#show', as: :rails_health_check
  get 'about-us', to: 'about#index', as: :about
  get 'sign-up', to: 'registrations#new'
  post 'sign-up', to: 'registrations#create'
  delete 'logout', to: 'sessions#destroy'
  root to: 'main#index'
end
