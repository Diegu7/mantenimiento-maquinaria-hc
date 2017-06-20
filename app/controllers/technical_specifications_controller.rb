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
    # @specifications = params[:machine][:technical_specifications_attributes]

    params[:machine][:technical_specifications_attributes].each do |k, v|
      k  = v["key"]
      v = v["value"]
      
      specification = TechnicalSpecification.new(key: k, value: v, machine_id: params[:machine_id])
      # tempTech=@machine.technical_specifications.new(specification_params(specification))
      User.find_or_initialize_by(name: "Roger") do |user|
        user.save
      end
      if  !(specification.save!)
        flash[:errors] = "No se pudo crear la especificacion"
        redirect_to new
      end
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
