class TechnicalSpecification < ApplicationRecord
  belongs_to :machine

  validates_presence_of :key
  validates_presence_of :value
end
