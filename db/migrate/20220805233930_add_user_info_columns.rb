class AddUserInfoColumns < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :balance, :float
    add_column :users, :role, :string, default: "trader"
    add_column :users, :trade_approved, :boolean, default: false
  end
end
