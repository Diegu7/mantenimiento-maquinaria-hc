class Product < ApplicationRecord
  belongs_to :product_brand

  validates_presence_of :name
  validates_presence_of :product_brand, :initial_stock, :current_stock, :minimum, :maximum, :specifications
  validates :initial_stock, :current_stock, :minimum, :maximum, numericality:  { greater_than_or_equal_to: 0 }
  has_attached_file :image, styles: {medium: "300x300>"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  attr_accessor :code
end
