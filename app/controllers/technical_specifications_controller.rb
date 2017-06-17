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
    #@specifications = params[:machine][:technical_specifications_attributes]

    params[:machine][:technical_specifications_attributes].each do |k, v|
      key  = v["key"]
      value = v["value"]
      
      @specification = TechnicalSpecification.new(key: key, value: value, machine_id: params[:machine_id])
      tempTech=@machine.technical_specifications.new(specification_params(@specification))
      tempTech.save
    end

    redirect_to @machine

    # for specification in @specifications do
    #   if specification["key"] != "" || specification["value"] != ""
    #     tempTech=@machine.technical_specifications.new(specification_params(specification))
    #     tempTech.save
    #   end

    #   redirect_to @machine
    # end

    # flash[:errors] = "No se pudo crear la transacción"
    # render :new
  end
  
  def destroy 
  end
  
  protected
    def specification_params2(my_params)
      my_params.permit(technical_specifications_attributes [:key, :value])
    end

    def specification_params(my_params)
      params.require(:technical_specification).permit(:key, :value, :machine_id)
    end

end
