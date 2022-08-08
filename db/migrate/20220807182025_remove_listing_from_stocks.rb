class RemoveListingFromStocks < ActiveRecord::Migration[7.0]
  def change
    remove_reference :stocks, :listing, index: true, foreign_key: true
  end
end
