class MaintenancePlan < ApplicationRecord
    after_initialize :default_values
    has_and_belongs_to_many :programmed_maintenances

    validates_presence_of :description, :scheduled_at, :programmed_maintenances

    def default_values
        self.description ||= "Plan de mantenimiento " + Date.today.to_s + ' # ' + rand(20).to_s
    end

    def programmed_maintenances_are_done
        self.programmed_maintenances.each do |maintenance|
            if  !maintenance.done
                return false
            end
        end
        return true
    end
    
        
end
