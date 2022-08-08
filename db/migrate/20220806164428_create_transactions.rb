class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.string "kind"
      t.float "price"
      t.integer "quantity"
      
      t.timestamps
    end
  end
end
