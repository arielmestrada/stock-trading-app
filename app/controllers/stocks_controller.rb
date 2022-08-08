class StocksController < ApplicationController
  before_action :authenticate_user!
  before_action :get_listing
  before_action :set_stock, only: %i[ show edit update destroy ]

  def index
    @stocks = @listing.stocks
  end

  def show
  end
  
  def new
    @stock = @listing.stocks.build
  end

  def edit
  end

  def create
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
    respond_to do |format|
      if @stock.update(stock_params)
        format.html { redirect_to listing_stock_path(@listing), notice: "Stock was successfully updated." }
        format.json { render :show, status: :ok, location: @stock }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
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
