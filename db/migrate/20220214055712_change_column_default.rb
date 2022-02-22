class ChangeColumnDefault < ActiveRecord::Migration[6.1]
  def change
    change_column_default :users, :role, 'member'
  end
end
