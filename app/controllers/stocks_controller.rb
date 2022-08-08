class StocksController < ApplicationController
    before_action :authenticate_user! 

    def index
        @stocks = Stock.where(user_id: current_user.id)
    end

    def show
    end

    def new        
        @stock = Stock.new
        @stock_details = Listing.find(params[:listing_id])
    end

    def create   
        @stock = Stock.new(stock_params)

        respond_to do |format|
            if @stock.save
            format.html { redirect_to stocks_path, notice: "Transaction was successfully created." }
            else
            format.html { render :new, status: :unprocessable_entity }
            end
        end
    end
    
    
    private
    # Only allow a list of trusted parameters through.
    def stock_params
        params.require(:stock).permit(:company_name, :symbol, :price, :quantity, :user_id, listing_id:params[:listing_id])
    end
end
