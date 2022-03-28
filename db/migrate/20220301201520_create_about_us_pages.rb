class CreateAboutUsPages < ActiveRecord::Migration[6.1]
  def change
    create_table :about_us_pages do |t|
      t.string :heading_image
      t.string :heading
      t.string :about_text
      t.string :mission_text
      t.string :club_image_1
      t.string :club_image_2

      t.timestamps
    end
  end
end
