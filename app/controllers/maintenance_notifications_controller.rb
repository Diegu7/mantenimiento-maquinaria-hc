class MaintenanceNotificationsController < ApplicationController

	def index
		@maintenance_notifications = MaintenanceNotification.all.order(:scheduled_at)
	end

  def edit
    @maintenance_notification = MaintenanceNotification.find(params[:id])
  end

  def update
    @maintenance_notification = MaintenanceNotification.find(params[:id])

      if @maintenance_notification.update_attributes(maintenance_notification_params)
            redirect_to @maintenance_notification
      else
          render :edit
      end
    end

	def create
		@maintenance_notification = MaintenanceNotification.new(maintenance_notification_params)
		
		if @maintenance_notification.save
      		@maintenance_notification.technical_specifications.create
      		redirect_to @maintenance_notification
    	else
      		flash[:errors] = 'No se pudo registrar la notificaion'
      		render :new
    end
	end

	def destroy
		@maintenance_notification = MaintenanceNotification.find(params[:id])
    @maintenance_notification.destroy
    redirect_to @maintenance_notification
  end

    private
    	
    def maintenance_notification_params
        params.require(:MaintenanceNotification).permit(:name, :description, :scheduled_at, :required_maintenance_id, :remaining_days)
    end
end
