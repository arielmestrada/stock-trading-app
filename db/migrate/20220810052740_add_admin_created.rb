class AddAdminCreated < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :admin_created, :boolean, :default => false
  end
end
