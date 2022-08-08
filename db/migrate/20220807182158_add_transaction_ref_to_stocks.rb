class AddTransactionRefToStocks < ActiveRecord::Migration[7.0]
  def change
    add_reference :stocks, :transaction, foreign_key: true
  end
end
