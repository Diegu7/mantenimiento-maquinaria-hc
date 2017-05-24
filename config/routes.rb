Rails.application.routes.draw do
  root 'dashboard#index'
  resources :machines do
    resources :technical_specifications
  end
  resources :machine_sections
end
