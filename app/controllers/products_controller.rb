class ProductsController < ApplicationController
    def index
        @products = Product.all.order(:name)
        @product = Product.new
    end

    def show
        @product = Product.find(params[:id])
    end

    def new
        @product = Product.new
    end

    def create
        @product = Product.new(product_params)

        if @product.save
            redirect_to @product
        else
            flash[:errors] = "No se pudo registrar el producto"
            render :new
        end
    end

    def edit
        @product = Product.find(params[:id])
    end

    def update
        @product = Product.find(params[:id])

        if @product.update_attributes(product_params)
            redirect_to @product
        else
            render :edit
        end
    end

    def destroy
        @product = Product.find(params[:id])
        @product.destroy
        redirect_to products_path
    end

    protected
        def product_params
            params.require(:product).permit(:name, :product_category_id, :product_brand_id, :initial_stock, :current_stock, :minimum, :maximum, :image)
        end
end
