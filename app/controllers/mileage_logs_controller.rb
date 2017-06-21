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

      #  @required_maintenances = @machine.required_maintenances
        
      #   @required_maintenances.each  do |maintenance|
      #       if maintenance.frequency_in_hours.present?
      #           @mileage_when_last_done = maintenance.mileage_when_last_done
      #           @current_mileage = @machine.total_hours
      #           @maintenance = RequiredMaintenance.find(maintenance.id)

      #           if @current_mileage - @mileage_when_last_done >= maintenance.frequency_in_hours
      #               # Validate if already exists a programmed maintenance for this required maintenance in this machine
      #               puts "LLEGA HASTA ANTES DEL IF"
      #               #if !(ProgrammedMaintenance.exists?(required_maintenance_id: maintenance.id))
      #                   # puts "SEGUNDO IF"                        
      #                   programmed = ProgrammedMaintenance.new
      #                   programmed.description = maintenance.description
      #                   programmed.scheduled_at = Date.today
      #                   programmed.estimated_duration = maintenance.estimated_duration
      #                   programmed.comments = "."
      #                   programmed.done_at = 1.day.from_now
      #                   programmed.done ||= false
      #                   programmed.preventive ||= false
      #                   programmed.machine = @machine
      #                   programmed.required_maintenance_id = @maintenance.id
      #                   programmed.save!
      #               #end
      #           end
      #       end
      #   end

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
