class StocksController < ApplicationController
  before_action :authenticate_user!

  def index
    @stocks = Stock.all
  end

  def add_to_portfolio
    stock = Stock.find(params[:id])
    current_user.stocks << stock unless current_user.stocks.include?(stock)
    redirect_to stocks_path, notice: "#{stock.name} was added to your portfolio."
  end
end
