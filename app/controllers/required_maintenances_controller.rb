class RequiredMaintenancesController < ApplicationController
    def index
        @machine = Machine.find(params[:machine_id])
    end

    def new
        @machine = Machine.find(params[:machine_id])
        @required_maintenance = @machine.required_maintenances.build
    end


    def edit
        @machine = Machine.find(params[:machine_id])
        @required_maintenance = RequiredMaintenance.find(params[:id])
    end

    def update
        @machine = Machine.find(params[:machine_id])
        @required_maintenance = @machine.required_maintenances.find(params[:id])

        if @required_maintenance.update_attributes(required_maintenance_params)
            redirect_to @machine
        else
            render :edit
        end
    end

    def create
        @machine = Machine.find(params[:machine_id])
        @required_maintenance = @machine.required_maintenances.build(required_maintenance_params)

        if @required_maintenance.save
            redirect_to @machine
        else
            flash[:errors] = "No se pudo crear el mantenimiento requerido"
            render :new
        end
    end

    def destroy       
        @machine = Machine.find(params[:machine_id])
        @required_maintenance = @machine.required_maintenances.find(params[:id])
        @required_maintenance.destroy
        redirect_to machine_mileage_logs_path(@machine)
    end

    protected
        def required_maintenance_params
            params.require(:required_maintenance).permit(:description, :estimated_duration, :machine_id, :machine_area_id, :frequency_in_hours, :frequency_in_days, :last_time_done_at, :mileage_when_last_done)
        end
end
