class DropMembersTable < ActiveRecord::Migration[6.1]
  def up
    drop_table :members, force: :cascade
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
