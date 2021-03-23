class User::MusicsController < ApplicationController
  before_action :authenticate_user!, except: [:top]

  def index
    @musics = Music.includes(:liked_users).sort {|a,b| b.liked_users.size <=> a.liked_users.size}
  end

  def new
    @music = Music.new
  end
  
  def search
    selection = params[:keyword]
    @music = Music.sort(selection)
  end

  def create
    @music = Music.new(music_params)
    @music.user_id = current_user.id
    if @music.save
      redirect_to music_path(@music.id)
    else
      render :new
    end
  end

  def show
    @music = Music.find(params[:id])
    @comment = Comment.new
    @comments = @music.comments
  end
  
  def edit
  end
  
  def update
    if @music.update(music_params)
       redirect_to music_path(@music.id),  notice: 'You have updated book successfully.'
    else
      render :edit
    end
  end

  def destroy
    music = Music.find(params[:id])
    music.destroy
    redirect_to musics_path
  end
  
  private
  def ensure_music
    @music = Music.find(params[:id])
    if @music.user != current_user
      redirect_to musics_path
    end
  end

  def music_params
    params.require(:music).permit(:name, :introduction, :user_id)
  end
end