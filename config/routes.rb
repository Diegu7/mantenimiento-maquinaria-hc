Rails.application.routes.draw do
  root 'dashboard#index'

  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"

  resources :machines
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
  # get '/programmed_maintenances/new_corrective', to: "programmed_maintenances#new_corrective"
  # post '/programmed_maintenances', to: "programmed_maintenances#create_corrective"
  # do 
  #   collection do
  #     get :new_corrective
  #     post :create_corrective
  #   end
  # end
end
