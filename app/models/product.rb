class Product < ApplicationRecord
    belongs_to :product_category
    belongs_to :product_brand
  
    validates_presence_of :name, :product_category, :product_brand, :initial_stock, :current_stock, :minimum, :maximum
    validates :initial_stock, :current_stock, :minimum, :maximum, numericality: true

    mount_uploader :image, ImageUploader
end
