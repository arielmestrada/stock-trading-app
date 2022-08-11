class TransactionsController < ApplicationController
    before_action :authenticate_user!

    def index
        if current_user.role == 'trader'
            @transactions = Transaction.where(user_id:current_user.id)
        else
            @transactions = Transaction.all     
        end
    end

    def show
        @transactions = Transaction.where(user_id:params[:id])
        authorize! :manage, Transaction
    end

end