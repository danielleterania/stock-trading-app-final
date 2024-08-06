require 'rails_helper'

RSpec.describe StocksController, type: :controller do
  before do
    @user = User.create!(email: 'trader@example.com', password: 'password', user_type: 'trader')
    @stock = Stock.create!(name: 'AAPL')
    sign_in @user
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'PATCH #add_to_portfolio' do
    it 'adds a stock to the user portfolio' do
      patch :add_to_portfolio, params: { id: @stock.id }
      expect(@user.stocks).to include(@stock)
    end
  end
end
