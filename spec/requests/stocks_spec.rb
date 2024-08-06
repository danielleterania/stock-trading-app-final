require 'rails_helper'

RSpec.describe "Stocks", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/stocks/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /add_to_portfolio" do
    it "returns http success" do
      get "/stocks/add_to_portfolio"
      expect(response).to have_http_status(:success)
    end
  end

end
