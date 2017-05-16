Rails.application.routes.draw do
  root 'dashboard#index'
  resources :machines
  resources :machine_sections
end
