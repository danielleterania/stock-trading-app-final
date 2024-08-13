class PortfoliosController < ApplicationController
  before_action :authenticate_user!

  def index
    @stocks = current_user.stocks
    @all_stocks = Stock.all
  end

  def add_to_portfolio
    @stock = Stock.find(params[:id])
    quantity = params[:quantity].to_i
    total_price = @stock.price * quantity

    if current_user.balance >= total_price
      quantity.times { current_user.stocks << @stock unless current_user.stocks.include?(@stock) }
      current_user.balance -= total_price
      current_user.save
      Transaction.create!(
        user: current_user,
        stock: @stock,
        transaction_type: 'buy',
        quantity: quantity,
        total_price: total_price
      )
      redirect_to portfolios_path, notice: 'Stock was successfully added to your portfolio.'
    else
      redirect_to stocks_path, alert: 'Insufficient balance to add stock to portfolio.'
    end
  end

  def sell
    @stock = Stock.find(params[:id])
    if current_user.stocks.include?(@stock)
      current_user.stocks.delete(@stock)
      current_user.balance += @stock.price
      current_user.save
      Transaction.create!(
        user: current_user,
        stock: @stock,
        transaction_type: 'sell',
        quantity: 1,
        total_price: @stock.price
      )
      redirect_to portfolios_path, notice: 'Stock was successfully sold from your portfolio.'
    else
      redirect_to portfolios_path, alert: 'Stock not found in your portfolio.'
    end
  end

  def buy
    @stock = Stock.find(params[:id])
    quantity = params[:quantity].to_i
    total_price = @stock.price * quantity

    if current_user.balance >= total_price
      quantity.times { current_user.stocks << @stock unless current_user.stocks.include?(@stock) }
      current_user.balance -= total_price
      current_user.save
      Transaction.create!(
        user: current_user,
        stock: @stock,
        transaction_type: 'buy',
        quantity: quantity,
        total_price: total_price
      )
      redirect_to portfolios_path, notice: 'Stock was successfully bought and added to your portfolio.'
    else
      redirect_to portfolios_path, alert: 'Insufficient balance to buy stock.'
    end
  end
end
