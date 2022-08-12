class DropTables < ActiveRecord::Migration[7.0]
  def change
    drop_table :users, force: :cascade
    drop_table :listings, force: :cascade
    drop_table :transactions, force: :cascade
  end
end
