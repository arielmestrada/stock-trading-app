module ApplicationHelper

    def get_recent_trans(role)
        if role == 'trader'
            @transactions = Transaction.where(user_id:current_user.id).sort{ |a,b| b.created_at <=> a.created_at }.slice(0,5)
        else
            @transactions = Transaction.all.sort{ |a,b| b.created_at <=> a.created_at}.slice(0,5)
        end
    end


    
    def get_all_trans(role)
        if role == 'trader'
            @transactions = Transaction.where(user_id:current_user.id).sort{ |a,b| b.created_at <=> a.created_at }
        else
            @transactions = Transaction.all.sort{ |a,b| b.created_at <=> a.created_at}
        end
    end


    def get_total_stock_value(id)
        number_to_currency User.find(id).stocks.map{|stock| stock.quantity * stock.listing.price}.sum
    end


    def get_user_last_trade(id)
        User.find(id).transactions.sort{ |a,b| b.created_at <=> a.created_at }[0].created_at
    end



end
