class Product < ApplicationRecord
    belongs_to :product_brand
  
    validates_presence_of :name
    validates_presence_of :product_brand, :initial_stock, :current_stock, :minimum, :maximum
    validates :initial_stock, :current_stock, :minimum, :maximum, numericality:  { greater_than_or_equal_to: 0 }
    validates_uniqueness_of :name
    
    mount_uploader :image, ImageUploader
end
