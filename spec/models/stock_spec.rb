require 'rails_helper'

RSpec.describe Stock, type: :model do
  it 'is valid with a name' do
    stock = Stock.new(name: 'AAPL')
    expect(stock).to be_valid
  end

  it 'is invalid without a name' do
    stock = Stock.new(name: nil)
    expect(stock).not_to be_valid
  end
end
