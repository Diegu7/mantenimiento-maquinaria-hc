class MachineSection < ApplicationRecord
  has_many :machines

  validates_presence_of :name
  validates_uniqueness_of :name
end
