class DropCalendarsTable < ActiveRecord::Migration[6.1]
  def up
    drop_table :calendars, force: :cascade
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
