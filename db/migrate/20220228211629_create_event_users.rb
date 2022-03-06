class CreateEventUsers < ActiveRecord::Migration[6.1]
	def change
		create_table :event_users do |t|
			t.belongs_to :user, null: false
			t.belongs_to :event, null: false
			t.boolean :attended
			t.timestamps
		end
  	end
end
