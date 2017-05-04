class MachinesController < ApplicationController
  def new
    @machine= new Machine
  end
  def create
    @machine= new Machine(machine_params)

    if(@machine.save)
      redirect_to @machine, notice: "Se agrego exitosamente"
    else
      flash[:errors] = "No se pudo registrar la maquina"
      render :new
    end
  end

  def edit
  end

  def delete
  end

  def update
  end

  protected
    def machine_params
      params.require(:machine).permit(:name, :tipe, :brand);
end
