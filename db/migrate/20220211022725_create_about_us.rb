class CreateAboutUs < ActiveRecord::Migration[6.1]
  def change
    create_table :about_us do |t|
      t.string :heading_image
      t.text :heading
      t.text :about_text
      t.text :mission_text
      t.string :club_image_1
      t.string :club_image_2

      t.timestamps
    end
  end
end
