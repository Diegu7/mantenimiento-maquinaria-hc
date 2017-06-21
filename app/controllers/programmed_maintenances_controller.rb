class ProgrammedMaintenancesController < ApplicationController
    def new_corrective
        @programmed_maintenance = ProgrammedMaintenance.new
		@programmed_maintenance.materials_for_maintenances.build
        @products = Product.all.order(:name)
        @machines = Machine.all.order(:name)
    end

    def create_corrective
        @programmed_maintenance = ProgrammedMaintenance.new(corrective_maintenance_params)
        @products = Product.all.order(:name)
        @machines = Machine.all.order(:name)
        @machine = @programmed_maintenance.machine

         if @programmed_maintenance.save
            redirect_to @machine
        else
            flash[:errors] = "No se pudo crear el mantenimiento"
            render :new_corrective
        end
    end

    def pending_maintenances
        @maintenances = ProgrammedMaintenance.pending
        render json: @maintenances
    end

    protected
        def corrective_maintenance_params
            params.require(:programmed_maintenance).permit(:estimated_duration, :done_at,:comments,:machine_id, materials_for_maintenances_attributes: [:id, :used_quantity, :product_id])
        end
end
