class CreateEventUsers < ActiveRecord::Migration[6.1]
	def change
		create_table :event_users do |t|
			t.boolean :attended
			t.timestamps
		end
  	end
end
