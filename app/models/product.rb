class Product < ApplicationRecord
    belongs_to :product_category
    belongs_to :product_brand
  
    validates_presence_of :name    
    validates_presence_of :product_category
    validates_presence_of :product_brand
    validates_presence_of :initial_stock
    validates_presence_of :current_stock
end
