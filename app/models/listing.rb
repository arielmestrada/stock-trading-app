class Listing < ApplicationRecord
    validates :name, presence: true
    validates :ticker, presence: true
    validates :price, presence: true
    validates :iex_volume, presence: true
    validates :previous_close, presence: true
    validates :change, presence: true
    validates :change_percent, presence: true
    validates :market_cap, presence: true
    validates :pe_ratio, presence: true
    validates :logo, presence: true

    has_many :stocks, dependent: :destroy
end
