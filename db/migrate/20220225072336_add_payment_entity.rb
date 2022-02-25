class AddPaymentEntity < ActiveRecord::Migration[6.1]
  def change
    create_table :paymentAccount do |t|
      t.string :internalName
      t.string :paymentAddress
     

      t.timestamps
  end
end
