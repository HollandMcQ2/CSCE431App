class DropOfficersTable < ActiveRecord::Migration[6.1]
  def up
    drop_table :officers, force: :cascade
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
