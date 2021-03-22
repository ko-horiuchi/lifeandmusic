class Users::CommentsController < ApplicationController

  def create
    @music = Music.find(params[:music_id])
    @comment = @music.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      render :index
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :item_id, :user_id)
  end
end
