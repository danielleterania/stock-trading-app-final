class Stock < ApplicationRecord
  
  has_many :transactions, dependent: :destroy
  has_and_belongs_to_many :users 
  has_many :users, through: :transactions 

  
  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }

  
end
