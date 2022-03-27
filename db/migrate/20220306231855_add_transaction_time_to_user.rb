class AddTransactionTimeToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :transaction_date, :datetime
  end
end
