class AddStockIdToTransactions < ActiveRecord::Migration[7.1]
  def change
    add_column :transactions, :stock_id, :integer
  end
end
