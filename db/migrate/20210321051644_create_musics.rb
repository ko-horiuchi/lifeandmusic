class CreateMusics < ActiveRecord::Migration[5.2]
  def change
    create_table :musics do |t|
      t.string :name
      t.integer :artist_id
      t.integer :scene, null: false, default: 0

      t.timestamps
    end
  end
end
