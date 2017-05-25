class MachineArea < ApplicationRecord
    has_many :required_maintenances
	
    validates_presence_of :name
    validates_uniqueness_of :name
end
