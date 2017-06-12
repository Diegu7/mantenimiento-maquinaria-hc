class Machine < ApplicationRecord
  belongs_to :machine_section

  has_many :mileage_logs, :dependent => :destroy
  has_many :technical_specifications, :dependent => :destroy
  has_many :required_maintenances, :dependent => :destroy
  has_many :programmed_maintenances, :dependent => :destroy

  validates_presence_of :name
  validates_presence_of :machine_section
  mount_uploader :image, UserImageUploader

  def total_hours
    mileage_logs.sum(:hours)
  end
  
end
