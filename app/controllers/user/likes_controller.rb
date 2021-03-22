class User::LikesController < ApplicationController
  
  def create
    @music = Music.find(params[:music_id])
    like = current_user.likes.build(music_id: params[:music_id])
    like.save
  end

  def destroy
    @music = Music.find(params[:music_id])
    like = Like.find_by(music_id: params[:music_id], user_id: current_user.id)
    like.destroy
  end
end
