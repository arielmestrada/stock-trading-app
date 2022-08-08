class TransactionsController < ApplicationController
  before_action :authenticate_user!
  def index
    @transactions = Transaction.where(user_id: current_user.id)
  end
end
