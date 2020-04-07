class CreateVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :videos do |t|
      t.string :title
      t.text :description
      t.string :duration
      t.string :main_poster
      t.string :gif_preview
      t.integer :external_id
      t.timestamps
    end
  end
end
