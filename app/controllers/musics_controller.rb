class MusicsController < ApplicationController

  def index
    @musics = Musics.all
  end

  def new
    @music = Music.new
  end

  def create
    @music = Music.new(music_params)
    if @music.save
      redirect_to music_path(@music.id)
    else
      render :new
    end
  end

  def show
    @music = Music.find(params[:id])
  end

  def music_params
    params.require(:music).permit(:name, :artist_id, :scene, :introduction)
  end
end