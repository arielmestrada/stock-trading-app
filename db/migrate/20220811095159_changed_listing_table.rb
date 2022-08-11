class ChangedListingTable < ActiveRecord::Migration[7.0]
  def change
    add_column :listings, :iex_volume, :integer
    add_column :listings, :previous_close, :float
    add_column :listings, :change, :float
    add_column :listings, :change_percent, :float
    add_column :listings, :market_cap, :float
    add_column :listings, :pe_ratio, :float
  end
end
