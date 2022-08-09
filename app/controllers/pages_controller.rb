class PagesController < ApplicationController
    before_action :authenticate_user!

    def index
        @users = User.where(role:'trader')

        @listings = Listing.all
    end

    def confirm_user
        User.find(params[:trader_id]).confirm
        redirect_to root_path
    end

    def portfolio
        @stocks = Stock.where(user_id:current_user.id)
    end
    
    def new
    end

    def create
    end

end
