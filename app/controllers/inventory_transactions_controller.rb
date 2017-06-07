class InventoryTransactionsController < ApplicationController
    def index
        @inventory_transactions = InventoryTransaction.all.order(:done_at)
    end
    
    def new
        @inventory_transaction = InventoryTransaction.new
		@inventory_transaction.inventory_transaction_details.build
        @products = Product.all.order(:name)
    end
    
    def create
        @inventory_transaction = InventoryTransaction.new(inventory_transactions_params)
        @products = Product.all.order(:name)

        if @inventory_transaction.save
            @product_details = @inventory_transaction.inventory_transaction_details

            # @product_details.each do |detail|
            #     detail.product.increment!(:current_stock,detail.quantity)
            # end

            redirect_to inventory_transactions_path
        else
            flash[:errors] = "No se pudo crear la transacción"
            render :new
        end
    end
    
    def destroy
        @inventory_transaction = InventoryTransaction.find(params[:id])
        @inventory_transaction.destroy
        redirect_to inventory_transactions_path
    end

    protected
        def inventory_transactions_params
            params.require(:inventory_transaction).permit(:done_at, inventory_transaction_details_attributes: [:id, :quantity, :product_id])
        end
end
