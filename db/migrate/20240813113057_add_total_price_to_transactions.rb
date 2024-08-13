class AddTotalPriceToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_column :transactions, :total_price, :decimal, precision: 10, scale: 2
  end
end
