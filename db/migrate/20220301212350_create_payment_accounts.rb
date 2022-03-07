class CreatePaymentAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :payment_accounts do |t|
      t.string :internal_name
      t.string :payment_address

      t.timestamps
    end
  end
end
