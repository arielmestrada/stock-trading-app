class UsersController < ApplicationController
    before_action :create_admin

    def destroy
        @user = User.find(params[:id])
        @user.destroy
    
        if @user.destroy
            redirect_to root_url
        end
      end

    private

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
