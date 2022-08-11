class Stock < ApplicationRecord
    # validate :insufficient_balance?, on: :create
    belongs_to :listing     
    after_save :delete_zero_quantity

    # def insufficient_balance?
    #     @balance = User.find(self.user_id).balance || 0
    #     @total_price = Listing.find(self.listing_id).price * self.quantity
    #     unless  @balance > @total_price
    #         errors[:attribute].push("Your validation message here")
    #         binding.pry
    #         return false
            
    #     end
    # end
    
    def delete_zero_quantity
        if self.quantity == 0
            self.delete            
        end
    end
end
