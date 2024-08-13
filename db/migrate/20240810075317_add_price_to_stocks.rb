class AddPriceToStocks < ActiveRecord::Migration[7.1]
  def change
    add_column :stocks, :price, :decimal, precision: 10, scale: 2
  end
end
