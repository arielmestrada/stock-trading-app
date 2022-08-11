class Listing < ApplicationRecord
    has_many :stocks, dependent: :destroy
end
