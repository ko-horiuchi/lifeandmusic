class CreateMusics < ActiveRecord::Migration[5.2]
  def change
    create_table :musics do |t|
      t.string :name
      t.string :video
      t.integer :user_id
      t.string :introduction

      t.timestamps
    end
  end
end
