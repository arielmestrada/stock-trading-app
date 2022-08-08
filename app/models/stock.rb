class Stock < ApplicationRecord
    belongs_to :listing
    after_save :add_new_transaction

    def add_new_transaction        
        @listing = Listing.find(self.listing_id)
        @transaction = Transaction.new
        @transaction.transaction_type = 'buy'
        @transaction.name = @listing.name
        @transaction.ticker = @listing.ticker
        @transaction.quantity = self.quantity
        @transaction.price = (@listing.price * self.quantity)
        @transaction.user_id = self.user_id
        @transaction.save!
    end
end
