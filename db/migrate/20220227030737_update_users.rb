class UpdateUsers < ActiveRecord::Migration[6.1]
	def change
		add_column :users, :is_current_member, :boolean, null: false, default: true
		add_column :users, :has_paid_dues, :boolean, default: false
	end
end
