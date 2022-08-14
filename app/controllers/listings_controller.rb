class ListingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_listing, only: %i[ show edit update destroy ]
  before_action :iex_client
  before_action :fallback_listings

  def index
   
    if Listing.all.empty?
      # gather and create info from iex      
      @listings = []
      @listings_array = @client.stock_market_list(:mostactive)
      if @listings_array.empty?
        @listings_array = @fallback_listings
      end      
      @listings_array.each do |quote|
        @logo = @client.logo(quote['symbol']).url
        @new_listing = Listing.new(
          name: quote['company_name'],
          ticker: quote['symbol'],
          price: quote['latest_price'],
          iex_volume: quote['iex_volume'],
          previous_close: quote['previous_close'],
          change: quote['change'],
          change_percent: quote['change_percent'],
          market_cap: quote['market_cap'],
          pe_ratio: quote['pe_ratio'],
          logo: @logo
        )
        @new_listing.save
      end
      redirect_to listings_path
    else

      @last_update = Listing.first.updated_at
      @client_last_update = @client.quote(Listing.first.ticker).latest_time
      if @client_last_update >= @last_update       
        @listings = Listing.all
        @listings.each do |listing|
          @new_price = @client.quote(listing.ticker).latest_price
          if @new_price != listing.price       
            listing.update(price: @new_price)
          end
        end
        return @listings
      else
        @listings = Listing.all
      
      end
    end
  end

  def show
    @stock = Stock.find_by(user_id: current_user.id, listing_id: params[:id])
    @listing = Listing.find(params[:id])
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

  def fallback_listings
    for i in 0..9
      @fallback_listings = []
      @listing = {
        name: "company #{i}",
        ticker: "company #{i} ticker",
        price: rand(500),
        iex_volume: rand(10000),
        previous_close: rand(500),
        change: rand(100),
        change_percent: rand,
        market_cap: rand(100000),
        pe_ratio: rand(100),
        logo: "test logo #{i}"
      }
      @fallback_listings << @listing
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
