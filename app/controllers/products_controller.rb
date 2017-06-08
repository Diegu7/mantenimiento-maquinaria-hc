class ProductsController < ApplicationController
    def index
        @products = Product.all.order(:name)
        @product = Product.new

        if params[:brand].present?
            brand = ProductBrand.find(params[:brand])
            @products = brand.products.order(:name)
        end
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
        params.require(:product).permit(:name, :image, :product_brand_id, :initial_stock, :current_stock, :minimum, :maximum, :specifications)
    end
end
