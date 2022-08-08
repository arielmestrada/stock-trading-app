class Stock < ApplicationRecord
    belongs_to :user
    belongs_to :listing
    has_many :transactions
end
