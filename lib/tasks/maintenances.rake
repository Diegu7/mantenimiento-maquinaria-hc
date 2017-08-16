namespace :maintenances do
  desc "Creates programmed maintenances according to required maintenances that are coming soon"
  task update: :environment do
    RequiredMaintenance.create_programmed_maintenances
    #RequiredMaintenance.create_maintenance_notifications
  end

end
