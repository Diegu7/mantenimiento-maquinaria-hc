Rails.application.routes.draw do
  root 'dashboard#index'
  resources :machines
  resources :technical_specifications
  resources :machine_sections
end
