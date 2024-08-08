require 'rails_helper'

RSpec.describe "Portfolios", type: :request do
  before do
    @user = User.create!(email: 'trader@example.com', password: 'password', user_type: 'trader')
    @stock = Stock.create!(name: 'AMZN')
    sign_in @user
  end

  describe "GET /index" do
    it 'returns http success' do
      get portfolios_path
      expect(response).to have_http_status(:success)
    end
  end

  end
end
