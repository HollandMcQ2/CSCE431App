class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.references :calendar, null: false, foreign_key: true
      t.datetime :time
      t.string :location
      t.string :link
      t.boolean :is_mandatory
      t.boolean :is_recurring
      t.text :description

      t.timestamps
    end
  end
end
