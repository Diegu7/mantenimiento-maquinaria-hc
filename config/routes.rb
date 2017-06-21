Rails.application.routes.draw do
  get 'mileage_logs/index'
 
  get 'mileage_logs/new'

  root 'dashboard#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  post '/machines/:machine_id/technical_specifications/new', to: 'technical_specifications#create', as: 'create_technical_specification'

  resources :machines do
    resources :mileage_logs, except: [:edit, :update, :show]
    resources :technical_specification
    resources :required_maintenances
  end
  
  resources :machine_sections, :machine_areas, except: :show

  resources :products
  resources :product_brands, except: :show

  resources :users, except: :show
  resources :inventory_transactions, except: :edit

  resources :programmed_maintenances do
    collection do
        get :new_corrective
        post :create_corrective
    end
  end
end
