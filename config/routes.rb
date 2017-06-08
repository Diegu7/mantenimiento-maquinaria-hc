Rails.application.routes.draw do
  get 'mileage_logs/index'

  get 'mileage_logs/new'

  root 'dashboard#index'

  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"

  resources :machines do
    resources :mileage_logs, except: [:edit, :update, :show]
  end
  resources :machine_sections, :machine_areas, except: :show

  resources :products
  resources :product_brands, except: :show

  resources :users, except: :show

  resources :inventory_transactions, except: :edit
end
