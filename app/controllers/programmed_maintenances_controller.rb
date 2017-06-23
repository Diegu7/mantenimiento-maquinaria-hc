class ProgrammedMaintenancesController < ApplicationController
    def index
        @programmed_maintenances = ProgrammedMaintenance.where(preventive: true, done: false).order(:scheduled_at)
    end
    
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

    def show
        @programmed_maintenance = ProgrammedMaintenance.find(params[:id])
    end

    def edit
        @programmed_maintenance = ProgrammedMaintenance.find(params[:id])
    end

    def update
        @programmed_maintenance = ProgrammedMaintenance.find(params[:id])
        @products = Product.all.order(:name)
        @machines = Machine.all.order(:name)
        
        @maintenance_plan =  @programmed_maintenance.maintenance_plans.first

        @programmed_maintenance.done = true

        if @programmed_maintenance.update_attributes(corrective_maintenance_params)
            redirect_to @maintenance_plan
        else
            render :template => "maintenance_plans/done"
        end
    end

    def destroy       
        @programmed_maintenance = ProgrammedMaintenance.find(params[:id])

        if @programmed_maintenance.maintenance_plans.blank?
            @programmed_maintenance.destroy
            redirect_to programmed_maintenances_path
        else
            flash[:errors] = "No se puede borrar porque pertenece a un plan, borre el plan primero"
            redirect_to programmed_maintenances_path
        end           
    end

    def events
        render json: ProgrammedMaintenancesHelper.events
    end

    protected
        def corrective_maintenance_params
            params.require(:programmed_maintenance).permit(:estimated_duration, :done_at,:comments,:machine_id, materials_for_maintenances_attributes: [:id, :used_quantity, :product_id])
        end
end
