Rails.application.routes.draw do
  root 'dashboard#index'
  resources :machines
  resources :machine_sections
  resources :machine_areas, except: :show
end
