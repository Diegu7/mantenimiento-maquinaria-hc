class Machine < ApplicationRecord
  belongs_to :machine_section

  has_many :mileage_logs, :dependent => :destroy
  has_many :technical_specifications, :dependent => :destroy
  has_many :required_maintenances, :dependent => :destroy
  has_many :programmed_maintenances, :dependent => :destroy

  validates_presence_of :name
  validates_presence_of :machine_section, :description
  has_attached_file :image, styles: {medium: "300x300>"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  accepts_nested_attributes_for :technical_specifications, reject_if: :all_blank, allow_destroy: true


  def total_hours
    mileage_logs.sum(:hours)
  end
  
end
