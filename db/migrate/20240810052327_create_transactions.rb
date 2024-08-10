class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.string :transaction_type
      t.decimal :amount, precision: 10, scale: 2
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
