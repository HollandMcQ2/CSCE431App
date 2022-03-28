class AddTransactionToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :transaction_amount, :bigint
    add_column :users, :transaction_last_4, :bigint
  end
end
