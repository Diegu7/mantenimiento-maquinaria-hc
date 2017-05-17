class MachineAreasController < ApplicationController
    def index
        @machine_areas = MachineArea.all.order(:name)
    end
    
    def new
        @machine_area = MachineArea.new
    end
    
    def show
        @machine_area = MachineArea.find(params[:id])
    end
    
    def create
        @machine_area = MachineArea.new(machine_areas_params)

        if @machine_area.save
            redirect_to machine_areas_path
        else
            flash[:errors] = "No se pudo crear el área"
            render :new
        end
    end
    
    def edit
        @machine_area = MachineArea.find(params[:id])
    end
    
    def update
        @machine_area = MachineArea.find(params[:id])

        if @machine_area.update_attributes(machine_areas_params)
            redirect_to machine_areas_path
        else
            render :edit
        end
    end
    
    def destroy
        @machine_area = MachineArea.find(params[:id])
        @machine_area.destroy
        redirect_to machine_areas_path
    end

    protected
        def machine_areas_params
            params.require(:machine_area).permit(:name)
        end
end
