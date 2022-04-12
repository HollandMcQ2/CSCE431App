class CreateAboutUsPageOfficerBiosJoinTable < ActiveRecord::Migration[6.1]
	def change
		create_table :about_us_page_officer_bios do |t|
			t.belongs_to :about_us_page, null: false
			t.belongs_to :officer_bio, null: false
			
			t.timestamps
		end
	end
end
