class MachineSectionsController < ApplicationController
    def index
        @machine_sections = MachineSection.all.order(:name)
    end
    
    def new
        @machine_section = MachineSection.new
    end
    
    def show
        @machine_section = MachineSection.find(params[:id])
    end
    
    def create
        @machine_section = MachineSection.new(machine_sections_params)

        if @machine_section.save
            redirect_to @machine_section
        else
            flash[:errors] = "No se pudo crear la sección"
            render :new
        end
    end
    
    def edit
        @machine_section = MachineSection.find(params[:id])
    end
    
    def update
        @machine_section = MachineSection.find(params[:id])

        if @machine_section.update_attributes(machine_sections_params)
            redirect_to @machine_section
        else
            render :edit
        end
    end
    
    def destroy
        @machine_section = MachineSection.find(params[:id])
        @machine_section.destroy
        redirect_to machine_sections_path
    end

    protected
        def machine_sections_params
            params.require(:machine_section).permit(:name)
        end
        
end
