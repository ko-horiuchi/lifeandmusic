class ArtistsController < ApplicationController

  def index
    @artists = Artists.all
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
  end

  def show
  end
  
  def artist_params
    params.require(:artist).permit(:name, :genre)
  end
end
