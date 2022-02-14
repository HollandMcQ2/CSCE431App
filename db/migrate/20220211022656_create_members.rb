class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|
      t.references :user, null: false, foreign_key: true
      t.string :attendance_count
      t.boolean :has_paid_dues

      t.timestamps
    end
  end
end
