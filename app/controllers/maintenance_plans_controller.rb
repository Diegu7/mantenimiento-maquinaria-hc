class MaintenancePlansController < ApplicationController
    def index
        @plans = MaintenancePlan.all.order(:scheduled_at)
    end

    def new
        @plan = MaintenancePlan.new
    end

    def show
        @plan = MaintenancePlan.find(params[:id])
    end

    def create
        @plan = MaintenancePlan.new(plan_params)

        if @plan.save
            redirect_to @plan
        else
            flash[:errors] = 'No se pudo crear el plan de mantemiento'
            render :new
        end
    end

    def edit
        @plan = MaintenancePlan.find(params[:id])
    end

    def destroy
        @plan = MaintenancePlan.find(params[:id])
        @plan.destroy
        redirect_to maintenance_plans_path
    end

    def update
        @plan = MaintenancePlan.find(params[:id])

        if @plan.update_attributes(plan_params)
            redirect_to @plan
        else
            render :edit
        end
    end

    protected
        def plan_params
            params.require(:plan).permit(:description, :scheduled_at)
        end
end
