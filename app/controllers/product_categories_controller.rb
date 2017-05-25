class ProductCategoriesController < ApplicationController
    def index
        @product_categories = ProductCategory.all.order(:name)
    end
    
    def new
        @product_category = ProductCategory.new
    end
    
    def create
        @product_category = ProductCategory.new(product_categories_params)

        if @product_category.save
            redirect_to product_categories_path
        else
            flash[:errors] = "No se pudo crear la categoría"
            render :new
        end
    end
    
    def edit
        @product_category = ProductCategory.find(params[:id])
    end
    
    def update
        @product_category = ProductCategory.find(params[:id])

        if @product_category.update_attributes(product_categories_params)
            redirect_to product_categories_path
        else
            render :edit
        end
    end
    
    def destroy
        @product_category = ProductCategory.find(params[:id])
        @product_category.destroy
        redirect_to product_categories_path
    end
    
    protected
        def product_categories_params
            params.require(:product_category).permit(:name)
        end
end
