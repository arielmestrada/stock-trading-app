class Transaction < ApplicationRecord
  validates :transaction_type, presence: true
  validates :quantity, presence: true
  validates :price, presence: true
  validates :name, presence: true
  validates :ticker, presence: true
  
  belongs_to :user  
end
