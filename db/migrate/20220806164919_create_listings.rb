class CreateListings < ActiveRecord::Migration[7.0]
  def change
    create_table :listings do |t|
      t.string "company_name"
      t.string "symbol"
      t.float "price"
      t.integer "quantity"

      t.timestamps
    end
  end
end
