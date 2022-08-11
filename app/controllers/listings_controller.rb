class ListingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_listing, only: %i[ show edit update destroy ]
  before_action :iex_client

  def index
   
    if Listing.all.empty?
      # gather and create info from iex
      @listings_array = @client.stock_market_list(:mostactive)
      @listings_array.each do |quote|
        @new_listing = Listing.new(
          name: quote['company_name'],
          ticker: quote['symbol'],
          price: quote['latest_price'],
          iex_volume: quote['iex_volume'],
          previous_close: quote['previous_close'],
          change: quote['change'],
          change_percent: quote['change_percent'],
          market_cap: quote['market_cap'],
          pe_ratio: quote['pe_ratio']
        )
        @new_listing.save
      end
      @listings = []
      redirect_to listings_path
      @today = Date.today.to_s
      @last_update = Listing.first.updated_at.to_s[0..9]
    else
      if @today != @last_update
        binding.pry
        @listings = Listing.all
        @listings.each do |listing|
          @new_price = @client.quote(listing.ticker).latest_price
          @listing = Listing.find(listing.id)
          @listing.update(price: @new_price)
        end
        redirect_to listings_path
      else
        @listings = Listing.all
      end
    end
  end

  def show
    @stock = Stock.find_by(user_id: current_user.id, listing_id: params[:id])
    @existing = @stock != nil ? true : false  
  end

  def new
    @listing = Listing.new
    authorize! :manage, Listing
  end

  def edit
    authorize! :manage, Listing
  end

  def create
    @listing = Listing.new(listing_params)

    respond_to do |format|
      if @listing.save
        format.html { redirect_to listing_url(@listing), notice: "Listing was successfully created." }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to listing_url(@listing), notice: "Listing was successfully updated." }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @listing.destroy

    respond_to do |format|
      format.html { redirect_to listings_url, notice: "Listing was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_listing
      @listing = Listing.find(params[:id])
    end

    def iex_client
      @client = IEX::Api::Client.new
    end

    def listing_params
      params.require(:listing).permit(:name, :ticker, :price)
    end
end
