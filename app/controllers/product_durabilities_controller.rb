class ProductDurabilitiesController < ApplicationController
	def index
		#@product_durability_comp = ProgrammedMaintenance.joins(:materials_for_maintenances).order(:scheduled_at).group(:id).count(:estimated_duration)
	end

	def new
		@product_durability = ProductDurability.new
	end

	def create
		@product_durability = ProductDurability.new(product_durability_params)
		if @product_durability.save 
			redirect_to product_durability_path(@product_durability.id)
		else
			render :new
		end
	end

	def product_durability_params
		params.require(:product_durability).permit(:product, :durability)
	end
end