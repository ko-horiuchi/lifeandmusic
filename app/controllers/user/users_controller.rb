class User::UsersController < ApplicationController

  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
    @musics = @user.musics
    @music = Music.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if current_user.update(user_params)
       redirect_to user_path(@user.id)
    else
       render :edit
    end
  end

  private
  def ensure_user
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to  user_path(current_user)
    end
  end

  def user_params
    params.require(:user).permit(:name, :introduction,:music_)
  end
end