Rails.application.routes.draw do
  root 'dashboard#index'
  resources :machines
  resources :machine_sections, except: :show
  resources :product_categories, :product_brands, except: :show
  resources :products
  resources :machine_areas, except: :show
end
