class Machine < ApplicationRecord  
  belongs_to :machine_category
  belongs_to :machine_section
  
  has_many :mileage_logs
  has_many :technical_specifications
  has_many :required_maintenances
  has_many :programmed_maintenances
  
  validates_presence_of :name
  validates_presence_of :machine_section
  validates_presence_of :machine_category
end
