class MachinesController < ApplicationController
  def index
    @machines = Machine.all.order(:name)

    if params[:section].present?
      section = MachineSection.find(params[:section])
      @machines = section.machines.order(:name)
    end
  end

  def new
    @machine = Machine.new
  end

  def show
    @machine = Machine.find(params[:id])
    @datasheets= @machine.technical_specifications
    @finishedMaintenances= @machine.programmed_maintenances.find_by done: true
    @requiredMaintenances= @machine.required_maintenances
  end

  def create
    @machine = Machine.new(machine_params)

    if @machine.save
      @machine.technical_specifications.create
      redirect_to @machine
    else
      flash[:errors] = 'No se pudo registrar la maquina'
      render :new
    end
  end

  def edit
    @machine = Machine.find(params[:id])
  end

  def destroy
    @machine = Machine.find(params[:id])
    @machine.destroy
    redirect_to machines_path
  end

  def update
    @machine = Machine.find(params[:id])

    if @machine.update_attributes(machine_params)
      redirect_to @machine
    else
      render :edit
    end
  end

  # def new_technical_specification
  #     # @programmed_maintenance = ProgrammedMaintenance.new
  #     # @programmed_maintenance.materials_for_maintenances.build
  #     # @products = Product.all.order(:name)
  #     # @machines = Machine.all.order(:name)
  #     @machine= Machine.find(params[:machine_id])
  #     @machine.technical_specifications.build
  # end

  # def create_technical_specification
  #     @programmed_maintenance = ProgrammedMaintenance.new(technical_specification_params)
  #     @products = Product.all.order(:name)
  #     @machines = Machine.all.order(:name)

  #       if @programmed_maintenance.save
  #         # redirect_to new_corrective_programmed_maintenances_path
  #         redirect_to root_path
  #     else
  #         flash[:errors] = "No se pudo crear el mantenimiento"
  #         render :new_corrective
  #     end
  # end

  protected
      def machine_params
        params.require(:machine).permit(:name, :machine_category_id, :machine_section_id, :description, :image)
      end

      # def technical_specification_params
      #     params.require(:programmed_maintenance).permit(:estimated_duration, :done_at,:comments,:machine_id, materials_for_maintenances_attributes: [:id, :used_quantity, :product_id])
      # end
end
