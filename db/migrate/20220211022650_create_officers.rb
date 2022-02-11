class CreateOfficers < ActiveRecord::Migration[6.1]
  def change
    create_table :officers do |t|
      t.references :user, null: false, foreign_key: true
      t.string :position
      t.string :picture
      t.text :bio

      t.timestamps
    end
  end
end
