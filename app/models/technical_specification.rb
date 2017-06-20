class TechnicalSpecification < ApplicationRecord
  belongs_to :machine

  validates_presence_of :key
  validates_presence_of :value

  def self.update_or_create(attributes)
    assign_or_new(attributes).save
  end

  def self.assign_or_new(attributes)
    obj = first || new
    obj.assign_attributes(attributes)
    obj
  end
end
