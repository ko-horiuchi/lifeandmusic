class Admin::ArtistsController < ApplicationController

  def index
    @artists = Artist.all
  end
  
  def show
    @artist = Artist.find(params[:id])
  end
  
  def edit
    @artist = Artist.find(params[:id])
  end
  
  def update
    @artist = Artist.find(params[:id])
    @artist.update(artist_params)
    redirect_to admin_artist_path(@artist.id)
  end
  
  def artist_params
    params.require(:artist).permit(:name, :genre)
  end
  
end
