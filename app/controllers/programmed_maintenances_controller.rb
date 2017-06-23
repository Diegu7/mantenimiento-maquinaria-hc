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

        @product_details = @programmed_maintenance.materials_for_maintenances

         if @programmed_maintenance.save
            @product_details.each do |detail|
                @product = Product.find(detail.product_id)
                @product.decrement!(:current_stock,detail.used_quantity)           
            end

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
        @programmed_maintenance.materials_for_maintenances.build
    end

    def update
        @programmed_maintenance = ProgrammedMaintenance.find(params[:id])

        # Getting the maintenace plan to which current programmed maintenance belongs
        @maintenance_plan =  @programmed_maintenance.maintenance_plans.first

        @programmed_maintenance.done = true

        if @programmed_maintenance.update_attributes(corrective_maintenance_params)

            @product_details = @programmed_maintenance.materials_for_maintenances

            # Decrementing current stock in products with used materials for this maintenace
            @product_details.each do |detail|
                @product = Product.find(detail.product_id)
                @product.decrement!(:current_stock,detail.used_quantity)           
            end

            # Setting the maintenance plan done when all its programmed maintenaces are set done
            # Setting done_at with the first programmed maintenance done date
            if @maintenance_plan.programmed_maintenances_are_done
                @maintenance_plan.done = true
                @maintenance_plan.done_at = @maintenance_plan.programmed_maintenances.first.done_at

                @maintenance_plan.save!
            end

            # Update last time done or last mileage log when done in the required maintenace 
            @required_maintenance = RequiredMaintenance.find(@programmed_maintenance.required_maintenance_id)

            puts @required_maintenance.description

            if @required_maintenance.frequency_in_hours > 0 # Then uses days to calculate incoming programmed maintenances
                @required_maintenance.mileage_when_last_done += @required_maintenance.frequency_in_hours
                @required_maintenance.save!
            else # Uses mileage log, set mileage_when_last_done
                @required_maintenance.last_time_done_at = @programmed_maintenance.done_at
                @required_maintenance.save!
            end                

            if (@maintenance_plan.done)
                 redirect_to @maintenance_plan
            else
                 redirect_to edit_maintenance_plan_path(@maintenance_plan)
            end
        else
            flash[:errors] = "No se pudo crear el mantenimiento"
            render :edit
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
