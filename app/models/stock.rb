class Stock < ApplicationRecord
    validates :quantity, presence: true
    belongs_to :listing
    after_save :delete_zero_quantity
    
    def delete_zero_quantity
        if self.quantity == 0
            self.delete            
        end
    end
end
