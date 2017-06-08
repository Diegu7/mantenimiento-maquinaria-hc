class TechnicalSpecificationsController < ApplicationController
  def index
    @specifications= TechnicalSpecifications.all
  end

  def new
    @machine= Machine.find(params[:machine_id])
    @datasheet= @machine.technical_specifications.new
  end

  def create
    @machine= Machine.find(params[:machine_id])
    @datasheet = @machine.technical_specifications.new(specification_params)

    if @datasheet.save
      redirect_to @machine
    else
      flash[:errors] = "No se pudo registrar la maquina"
      render :new
    end
  end

  protected
    def specification_params
      params.require(:technical_specification).permit(:key, :value, :machine_id)
    end

end
