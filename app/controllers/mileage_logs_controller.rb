class MileageLogsController < ApplicationController
  def index
  end

  def new
    @machine = Machine.find(params[:machine_id])
    @mileage_log = @machine.mileage_logs.build
  end

  def create
    @machine = Machine.find(params[:machine_id])
    @mileage_log = @machine.mileage_logs.build(mileage_log_params)

    if @mileage_log.save
      redirect_to @machine
    else
      flash[:errors] = "No se pudo ingresar el horometraje"
      render :new
    end
  end

  def destroy
  end

  protected
    def mileage_log_params
      params.require(:mileage_log).permit(:hours, :date)
    end
end
