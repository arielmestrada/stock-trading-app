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
    @current_balance = User.find(current_user.id).balance || 0
    @quantity = params[:stock][:quantity].to_i
    @total_price = @listing.price * @quantity
    @new_balance = @current_balance - @total_price
    @stock = Stock.new(
      user_id: current_user.id,
      listing_id: @listing.id,
      quantity: @quantity
    )
    @transaction = Transaction.new(
        name: @listing.name,
        ticker: @listing.ticker,
        quantity: @quantity,
        price: @total_price,
        user_id: current_user.id,
        transaction_type: 'Buy'
    )

    if @current_balance > @total_price
      @stock.save!
      User.find(current_user.id).update(balance: @new_balance)
      @transaction.save!
      redirect_to portfolio_path
    else
      redirect_to buy_stock_path(@listing.id, custom_error: 'Insufficient Balance')
    end

    # @stock = @listing.stocks.build(stock_params)

    # respond_to do |format|
    #   if @stock.save
    #     format.html { redirect_to portfolio_path, notice: "Stock was successfully created." }
    #     format.json { render :show, status: :created, location: @stock }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @stock.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def update
    @current_quantity = User.find(current_user.id).stocks.find_by(listing_id: @listing.id).quantity
    @current_balance = User.find(current_user.id).balance || 0
    @quantity = params[:quantity].to_i
    @total_price = @listing.price * @quantity
    @new_balance = @current_balance - @total_price
    @transaction = Transaction.new(
        name: @listing.name,
        ticker: @listing.ticker,
        quantity: @quantity,
        price: @total_price,
        user_id: current_user.id,
        transaction_type: nil
    )

    if params[:transaction_type] == 'buy'
      if @current_balance < @total_price
        redirect_to buy_stock_path(@listing.id, custom_error: 'Insufficient Balance')
      else
        @total_quantity = (@stock.quantity + @quantity)    
        @stock.update(quantity: @total_quantity)
        User.find(current_user.id).update(balance: @new_balance)
        @transaction.transaction_type = 'Buy'
        @transaction.save!
        redirect_to portfolio_path
      end
    else
      if @current_quantity < @quantity
        redirect_to sell_stock_path(@listing.id, custom_error: 'Insufficient quantity')
      else
        @new_balance = @current_balance + @total_price
        @total_quantity = (@stock.quantity - @quantity)
        @stock.update(quantity: @total_quantity)
        User.find(current_user.id).update(balance: @new_balance)
        @transaction.transaction_type = 'Sell'
        @transaction.save!  
        redirect_to portfolio_path
      end
    end

    

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
