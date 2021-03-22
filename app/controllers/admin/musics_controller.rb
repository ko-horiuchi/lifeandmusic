class Admin::MusicsController < ApplicationController
  
  def index
    @musics = Music.all
  end
end