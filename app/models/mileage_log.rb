class MileageLog < ApplicationRecord
  belongs_to :machine

  validates_presence_of :date
  validates_presence_of :hours
end
