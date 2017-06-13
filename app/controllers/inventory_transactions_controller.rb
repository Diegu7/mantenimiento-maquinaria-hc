class InventoryTransactionsController < ApplicationController
    def index
        @inventory_transactions = InventoryTransaction.all.order(:done_at)
    end

    def show
        @transaction = InventoryTransaction.find(params[:id])
        @details = @transaction.inventory_transaction_details
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
            @type = @inventory_transaction.transaction_type  
                
            @product_details.each do |detail|
                @product = Product.find(detail.product_id)
                if @type == 'Entrada'
                    @product.increment!(:current_stock,detail.quantity)                          
                elsif @type == 'Salida'
                    @product.decrement!(:current_stock,detail.quantity)
                end
            end

            redirect_to inventory_transactions_path
        else
            flash[:errors] = "No se pudo crear la transacción"
            render :new
        end
    end
    
    def destroy
        @inventory_transaction = InventoryTransaction.find(params[:id])
        @product_details = @inventory_transaction.inventory_transaction_details  
        @type = @inventory_transaction.transaction_type  
                
        @product_details.each do |detail|
            @product = Product.find(detail.product_id)
            if @type == 'Entrada'
                @product.decrement!(:current_stock,detail.quantity)           
            elsif @type == 'Salida'
                @product.increment!(:current_stock,detail.quantity)
            end
        end

        @inventory_transaction.destroy
        redirect_to inventory_transactions_path
    end

    protected
        def inventory_transactions_params
            params.require(:inventory_transaction).permit(:done_at, :transaction_type ,inventory_transaction_details_attributes: [:id, :quantity, :product_id])
        end
end
