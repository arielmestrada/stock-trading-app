class PagesController < ApplicationController
    before_action :authenticate_user!

    def index
    end

    def portfolio
        @stocks = Stock.where(user_id:current_user.id)
    end
end
