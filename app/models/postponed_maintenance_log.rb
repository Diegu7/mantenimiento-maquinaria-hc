class PostponedMaintenanceLog < ApplicationRecord
     belongs_to :programmed_maintenance

     validates_presence_of :reason, :previous_date, :new_date, :programmed_maintenance
end
