class MaintenancePlan < ApplicationRecord
    has_and_belongs_to_many :programmed_maintenances

    validates_presence_of :description, :scheduled_at, :programmed_maintenances 
end
