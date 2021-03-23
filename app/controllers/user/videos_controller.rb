class User::VideosController < ApplicationController

  def index
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(videos_params)
    @video.save
  end

  private
  def videos_params
    params.require(:video).permit(:video_top)
  end
end
