class RemoveTradeApprovedColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :trade_approved, :boolean
  end
end
