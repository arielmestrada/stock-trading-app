class AddListingRefToStocks < ActiveRecord::Migration[7.0]
  def change
    add_reference :stocks, :listing, foreign_key: true
  end
end
