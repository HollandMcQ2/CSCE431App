class AddContentsToAboutUsPage < ActiveRecord::Migration[6.1]
  def change
    add_column :about_us_pages, :contents, :string
    add_column :about_us_pages, :email, :string
  end
end
