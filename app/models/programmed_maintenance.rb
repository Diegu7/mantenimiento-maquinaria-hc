class ProgrammedMaintenance < ApplicationRecord
     belongs_to :machine

     has_many :materials_for_maintenances

     validates_presence_of :description, :scheduled_at,:estimated_duration, :comments, :done_at

     validates :estimated_duration, numericality:  { greater_than_or_equal_to: 0 }
end
