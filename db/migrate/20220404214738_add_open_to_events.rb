class AddOpenToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :open, :boolean, :default => false
  end
end
