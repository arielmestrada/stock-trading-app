class PagesController < ApplicationController
    before_action :authenticate_user!
    before_action :create_admin
    # load_and_authorize_resource    

    def index
        @users_pending = User.where(role:'trader').reject{|user| user.confirmed?}
        @users_approve = User.where(role:'trader').reject{|user| !user.confirmed?}
        @listings = Listing.all
    end

    def confirm_user
        User.find(params[:trader_id]).confirm
        redirect_to root_path
    end

    def portfolio
        @stocks = Stock.where(user_id: current_user.id)
        authorize! :manage, Stock
    end
    
    def new
        authorize! :manage, User
    end

    def create        
        @user = User.new
        @user.email = params[:email]
        @user.password = params[:password]
        @user.password_confirmation = params[:password_confirmation]        
        @user.first_name = params[:first_name]        
        @user.last_name = params[:last_name]   
        @user.admin_created = params[:admin_created]   
        @user.skip_confirmation! if params[:admin_created]
        @user.save    
        UserMailer.user_confirmation(@user).deliver_later if @user.save
        redirect_to root_path
    end

    def show
        @user = User.find(params[:id])   
        authorize! :manage, User     
    end

    def edit
        @user = User.find(params[:id])
        authorize! :manage, User        
    end

    def update
        @user = User.find(params[:id])
        @user.update(first_name: params[:first_name], last_name: params[:last_name], email: params[:email])
        redirect_to user_path(params[:id])
    end

    def balance
        @balance = User.find(current_user.id).balance
    end

    def add_money
        @balance = User.find(current_user.id).balance || 0
        @balance_total = (@balance + params[:balance].to_f)
        User.find(current_user.id).update(balance: @balance_total)
        redirect_to root_path
    end

    def create_admin
        if User.all.empty?
            @user = User.new
            @user.email = 'estrada.ariel.m@gmail.com'
            @user.password = '123456'
            @user.password_confirmation = '123456'      
            @user.first_name = 'Ariel'      
            @user.last_name = 'Estrada'  
            @user.admin_created = true  
            @user.skip_confirmation!
            @user.save
            redirect_to root_path
        end
    end

end
