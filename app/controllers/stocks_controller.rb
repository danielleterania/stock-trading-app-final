# app/controllers/stocks_controller.rb
class StocksController < ApplicationController
  before_action :authenticate_user!

  def index
    @stocks = Stock.all
  end

  def add_to_portfolio
    @stock = Stock.find(params[:id])
    current_user.stocks << @stock
    redirect_to portfolios_path, notice: 'Stock was successfully added to your portfolio.'
  end
end
