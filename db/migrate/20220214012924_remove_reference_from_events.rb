class RemoveReferenceFromEvents < ActiveRecord::Migration[6.1]
  def change
    remove_reference :events, :calendar, null: false, foreign_key: true
  end
end
