class CreateContactForms < ActiveRecord::Migration[6.1]
  def change
    create_table :contact_forms do |t|
      t.string :name
      t.string :email
      t.string :company
      t.text :message
      t.string :date_submitted

      t.timestamps
    end
  end
end
