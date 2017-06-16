class TechnicalSpecificationsController < ApplicationController
  def index
    @specifications= TechnicalSpecifications.all
  end

  def new
    @machine= Machine.find(params[:machine_id])
    @machine.technical_specifications.build
  end

  def create
  end

  def update
    @machine= Machine.find(params[:machine_id])
    @specifications = @machine.technical_specifications

    if @machine.save
      redirect_to @machine
    else
       flash[:errors] = "No se pudo crear la transacción"
       render :new
    end
  end
  
  def destroy 
  end
  
  protected
    def specification_params(my_params)
      my_params.permit(technical_specifications_attributes [:key, :value])
    end

end
