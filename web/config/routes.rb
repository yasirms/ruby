require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  resources :weather_reports, only: [:index, :update]
  resources :locations, only: :index
end
