module ApplicationHelper

    def get_all_trans(role)
        if role == 'trader'
            @transactions = Transaction.where(user_id:current_user.id)
        else
            @transactions = Transaction.all     
        end
    end


end
