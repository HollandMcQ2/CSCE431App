class AddContentsToOfficerBio < ActiveRecord::Migration[6.1]
  def change
    add_column :officer_bios, :full_name, :string
  end
end
