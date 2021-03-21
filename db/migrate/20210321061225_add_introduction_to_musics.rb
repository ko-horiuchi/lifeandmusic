class AddIntroductionToMusics < ActiveRecord::Migration[5.2]
  def change
    add_column :musics, :introduction, :text
  end
end
