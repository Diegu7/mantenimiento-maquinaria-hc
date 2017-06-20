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

    params[:machine][:technical_specifications_attributes].each do |k, v|
      k  = v["key"]
      v = v["value"]
      TechnicalSpecification.where(key: k).update_or_create(value: v,machine_id: params[:machine_id])
    end

    redirect_to @machine   
  end
  
  def destroy 
  end
  
  protected
    def specification_params2(my_params)
      my_params.permit(technical_specifications_attributes [:key, :value])
    end

    def specification_params(my_params)
      my_params.permit(:key, :value, :machine_id)
    end

end
