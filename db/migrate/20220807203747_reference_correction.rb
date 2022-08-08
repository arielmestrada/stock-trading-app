class ReferenceCorrection < ActiveRecord::Migration[7.0]
  def change
    remove_reference :stocks, :transaction, index: true, foreign_key: true
    add_reference :transactions, :stock, foreign_key: true
  end
end
