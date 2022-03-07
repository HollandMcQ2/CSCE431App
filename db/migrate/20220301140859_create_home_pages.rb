class CreateHomePages < ActiveRecord::Migration[6.1]
  def change
    create_table :home_pages do |t|
      t.string :slider_image_1
      t.string :slider_image_2
      t.string :slider_image_3
      t.string :slider_image_4
      t.string :slider_image_5
      t.string :heading
      t.string :summary

      t.timestamps
    end
  end
end
