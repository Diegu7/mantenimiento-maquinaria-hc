class MaintenancePlan < ApplicationRecord
    has_many :programmed_maintenances

    validates_presence_of :description, :scheduled_at, :done_at, :done?
end
