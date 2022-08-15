class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :create_admin

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :username])
        devise_parameter_sanitizer.permit(:sign_in, keys: [:username])
        devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :username])
    end

    def after_sign_in_path_for(resource)
        root_path
    end

    def after_sign_out_path_for(resource)
        new_user_session_path
    end

    def create_admin
        if User.all.empty?
            @user = User.new
            @user.email = 'estrada.ariel.m@gmail.com'
            @user.password = '123456'
            @user.password_confirmation = '123456'      
            @user.first_name = 'Ariel'      
            @user.last_name = 'Estrada'  
            @user.role = 'admin'  
            @user.admin_created = true  
            @user.skip_confirmation!
            @user.save
            redirect_to root_path
        end
    end
end
