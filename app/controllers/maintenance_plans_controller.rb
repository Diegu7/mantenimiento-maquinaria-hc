class MaintenancePlansController < ApplicationController
    def index
        @maintenance_plans = MaintenancePlan.all.order(:scheduled_at)
    end

    def new
        @maintenance_plan = MaintenancePlan.new
    end

    def show
        @maintenance_plan = MaintenancePlan.find(params[:id])
    end

    def create
        @maintenance_plan = MaintenancePlan.new(plan_params)

        if @maintenance_plan.save
            @programmed_maintenances = @maintenance_plan.programmed_maintenances

            @programmed_maintenances.each do |maintenance|
                maintenance.scheduled = true
                maintenance.save!
            end
            redirect_to @maintenance_plan
        else
            flash[:errors] = 'No se pudo crear el plan de mantemiento'
            render :new
        end
    end

    def destroy
        @maintenance_plan = MaintenancePlan.find(params[:id])
        @programmed_maintenances = @maintenance_plan.programmed_maintenances

        @programmed_maintenances.each do |maintenance|
            ProgrammedMaintenance.where(id: maintenance.id).update_all(scheduled: false)
        end      

        @maintenance_plan.destroy
        
        redirect_to maintenance_plans_path
    end

    def edit
        @maintenance_plan = MaintenancePlan.find(params[:id])
    end

    def update
        @maintenance_plan = MaintenancePlan.find(params[:id])

        if @plan.update_attributes(plan_params)
            redirect_to @maintenance_plan
        else
            render :edit
        end
    end

    protected
        def plan_params
            params.require(:maintenance_plan).permit(:description, :scheduled_at, programmed_maintenance_ids:[])
        end
end
