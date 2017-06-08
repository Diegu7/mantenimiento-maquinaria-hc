class TechnicalSpecificationsController < ApplicationController
  def index
    @specifications= TechnicalSpecifications.all
  end

  def new
    @machine= Machine.find(params[:machine_id])
    @datasheet=[]
    @datasheet << @machine.technical_specifications.new
    @datasheet << @machine.technical_specifications.new
    @datasheet << @machine.technical_specifications.new
    @datasheet << @machine.technical_specifications.new
    @datasheet << @machine.technical_specifications.new
    @datasheet << @machine.technical_specifications.new
    #@datasheet= @machine.technical_specifications.new
  end

  def create
    @machine= Machine.find(params[:machine_id])
    if params.has_key?("technical_specification")
      tempTech=@machine.technical_specifications.new(specification_params("technical_specification"))
      tempTech.save
    else
      for specification in params["technical_specifications"] do
        if specification["key"] != "" || specification["value"] != ""
          tempTech=@machine.technical_specifications.new(specification_params(specification))
          tempTech.save
        end
      end
    end
    redirect_to @machine
#    if @datasheet.save
#      redirect_to @machine
#    else
#      flash[:errors] = "No se pudo registrar la maquina"
#      render :new
#    end
  end

  protected
    def specification_params(my_params)
      my_params.permit(:key, :value, :machine_id)
    end

end
