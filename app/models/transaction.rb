class Transaction < ApplicationRecord
    belongs_to :user
    belongs_to :stock
  
    validates :transaction_type, inclusion: { in: %w(buy sell) }
    validates :quantity, :total_price, presence: true
  end
  