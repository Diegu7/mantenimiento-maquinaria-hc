class MachinesController < ApplicationController
  def index
    @machines = Machine.all.order(:name)
  end

  def new
    @machine = Machine.new
    @datasheet= @machine.technical_specifications.build
  end

  def show
    @machine = Machine.find(params[:id])
  end

  def create
    @machine = Machine.new(machine_params)

    if @machine.save
      redirect_to @machine
    else
      flash[:errors] = "No se pudo registrar la maquina"
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

  protected
    def machine_params
      params.require(:machine).permit(:name, :machine_category_id, :machine_section_id)
    end
end
