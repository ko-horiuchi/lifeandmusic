class MusicsController < ApplicationController
  before_action :authenticate_user!, except: [:top]

  def index
    @musics = Music.all
  end

  def new
    @music = Music.new
  end

  def create
    @music = Music.new(music_params)
    @blog.user_id = current_user.id
    if @music.save
      redirect_to musics_path
    else
      render :new
    end
  end

  def show
    @music = Music.find(params[:id])
    @comment = Comment.new
    @comments = @music.comments
  end

  def music_params
    params.require(:music).permit(:name, :artist_id, :scene, :introduction, :user_id)
  end
end