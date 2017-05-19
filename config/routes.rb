Rails.application.routes.draw do
  root 'dashboard#index'

  resources :machines
  resources :machine_sections, :machine_areas, except: :show

  resources :products
  resources :product_categories, :product_brands, except: :show

  resources :users, except: :show
  
end
