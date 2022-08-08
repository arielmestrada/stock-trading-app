class AddColumnToTransactions < ActiveRecord::Migration[7.0]
  def change
    add_column :transactions, :name, :string
    add_column :transactions, :ticker, :string
  end
end
