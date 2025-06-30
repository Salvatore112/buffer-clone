Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  get "/about-us", to: "about#index", as: :about
  root to: "main#index"
end
