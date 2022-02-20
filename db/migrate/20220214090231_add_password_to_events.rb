class AddPasswordToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :password, :string
  end
end
