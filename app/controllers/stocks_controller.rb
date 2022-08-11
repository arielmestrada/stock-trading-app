class StocksController < ApplicationController
  before_action :authenticate_user!
  before_action :get_listing
  before_action :set_stock, only: %i[ show edit update destroy ]
  load_and_authorize_resource

  def buy  
    @stock_build = @listing.stocks.build  
    @stock = Stock.find_by(user_id: current_user.id, listing_id: @listing.id)
    @existing = @stock != nil ? true : false   
  end

  def sell
    @stock = Stock.find_by(user_id: current_user.id, listing_id: @listing.id)
  end

  def index
    @stocks = @listing.stocks.where(user_id: current_user.id)
  end

  def show
  end
  
  def new        
    @stock = @listing.stocks.build
  end

  def edit
  end

  def create  
    # Stock.create(
    #   listing_id: @listing.id,
    #   user_id: current_user.id,
    #   quantity: param[:quantity].to_i
    # )
    # binding.pry
    @stock = @listing.stocks.build(stock_params)

    respond_to do |format|
      if @stock.save
        format.html { redirect_to listing_stocks_path(@listing), notice: "Stock was successfully created." }
        format.json { render :show, status: :created, location: @stock }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @quantity = params[:quantity].to_i
    @transaction = Transaction.new(
        name: @listing.name,
        ticker: @listing.ticker,
        quantity: @quantity,
        price: (@listing.price * @quantity),
        user_id: current_user.id,
        transaction_type: nil
    )
      
    if params[:transaction_type] == 'buy'  
      @total_quantity = (@stock.quantity + @quantity)    
      @stock.update(quantity: @total_quantity)
      @transaction.transaction_type = 'Buy'
      @transaction.save!
    elsif params[:transaction_type] == 'sell'
      @total_quantity = (@stock.quantity - @quantity)
      # if @total_quantity = 0
      #   binding.pry
      #   @stock.destroy
      #   redirect_to portfolio_path
      # else
        @stock.update(quantity: @total_quantity)
        @transaction.transaction_type = 'Sell'
        @transaction.save!
      # end
      
    end

    redirect_to portfolio_path

  end

  def destroy
    @stock.destroy

    respond_to do |format|
      format.html { redirect_to listing_stocks_path(@listing), notice: "Stock was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def get_listing
      @listing = Listing.find(params[:listing_id])
    end

    def set_stock
      @stock = @listing.stocks.find(params[:id])
    end

    def stock_params
      params.require(:stock).permit(:quantity, :listing_id, :user_id)
    end
end
