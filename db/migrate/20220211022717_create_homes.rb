class CreateHomes < ActiveRecord::Migration[6.1]
  def change
    create_table :homes do |t|
      t.string :slider_image_1
      t.string :slider_image_2
      t.string :slider_image_3
      t.string :slider_image_4
      t.string :slider_image_5
      t.text :heading
      t.text :summary

      t.timestamps
    end
  end
end
