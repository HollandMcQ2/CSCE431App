class CreateSemesters < ActiveRecord::Migration[6.1]
  def change
    create_table :semesters do |t|
      t.string :name
      t.datetime :start
      t.datetime :end
      t.float :duescost

      t.timestamps
    end
  end
end
