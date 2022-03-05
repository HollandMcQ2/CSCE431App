class CreateAboutUsPagesOfficerBiosJoinTable < ActiveRecord::Migration[6.1]
	def change
		create_join_table :about_us_pages, :officer_bios
	end
end
