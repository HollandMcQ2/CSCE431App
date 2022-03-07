class CreateOfficerBios < ActiveRecord::Migration[6.1]
	def change
		create_table :officer_bios do |t|
			t.belongs_to :user, null: false
			t.string :bio_text
			t.string :portrait_image
			t.boolean :visible
			t.timestamps
		end
	end
end
