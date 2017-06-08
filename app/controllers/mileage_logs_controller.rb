class MileageLogsController < ApplicationController
  def index
    @machine = Machine.find(params[:machine_id])
  end

  def new
    @machine = Machine.find(params[:machine_id])
    @mileage_log = @machine.mileage_logs.build
  end

  def create
    @machine = Machine.find(params[:machine_id])
    @mileage_log = @machine.mileage_logs.build(mileage_log_params)

    if @mileage_log.save
      redirect_to machine_mileage_logs_path(@machine)
    else
      flash[:errors] = "No se pudo ingresar el horometraje"
      render :new
    end
  end

  def destroy
    @machine = Machine.find(params[:machine_id])
    @mileage_log = @machine.mileage_logs.find(params[:id])
    @mileage_log.destroy
    redirect_to machine_mileage_logs_path(@machine)
  end

  protected
    def mileage_log_params
      params.require(:mileage_log).permit(:hours, :date)
    end
end
