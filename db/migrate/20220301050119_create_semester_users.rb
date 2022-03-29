class CreateSemesterUsers < ActiveRecord::Migration[6.1]
	def change
		create_table :semester_users do |t|
			t.belongs_to :user, null: false
			t.belongs_to :semester, null: false
			t.boolean :paid_dues
			
			t.timestamps
		end
	end
end
