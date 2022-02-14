class CreateCalendars < ActiveRecord::Migration[6.1]
  def change
    create_table :calendars do |t|
      t.integer :event_id
      t.string :notification_frequency

      t.timestamps
    end
  end
end
