require 'rails_helper'

RSpec.describe "Stocks", type: :request do
  describe "GET /index" do
    it "returns a successful response" do
      get '/stocks'
      expect(response).to have_http_status(302)
    end
  end

  describe "PATCH /add_to_portfolio" do
    it "redirects after successfully adding a stock" do
      stock = Stock.create!(id: 1, name: 'AAPL')
      patch add_to_portfolio_stock_path(stock)
      expect(response).to have_http_status(302)
    end
  end
end

