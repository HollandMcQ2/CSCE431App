class CreateContactForms < ActiveRecord::Migration[6.1]
  def change
    create_table :contact_forms do |t|
      t.string :name
      t.string :email
      t.string :company
      t.string :message
      t.datetime :date_submitted

      t.timestamps
    end
  end
end
