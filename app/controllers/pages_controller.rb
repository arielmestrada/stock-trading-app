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
        @user = User.new
        @user.email = params[:email]
        @user.password = params[:password]
        @user.password_confirmation = params[:password_confirmation]        
        @user.first_name = params[:first_name]        
        @user.last_name = params[:last_name]   
        @user.admin_created = params[:admin_created]   
        @user.save    
        redirect_to root_path
    end

    def show
        @user = User.find(params[:id])
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        @user.update(first_name: params[:first_name], last_name: params[:last_name], email: params[:email])
        redirect_to user_path(params[:id])
    end

end
