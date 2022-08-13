class AddColumnLogoToListings < ActiveRecord::Migration[7.0]
  def change
    add_column :listings, :logo, :string
  end
end
