class AlbumsController < ApplicationController
  
  def index
    @albums = Album.all
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
    @album = Album.new
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])
    @album.update_attributes(params[:album])
    if @album.save
      redirect_to album_url(@album)
    else
      render :edit
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to albums_url
  end

  def create
    @album = Album.new(params[:album])
    if @album.save
      redirect_to album_url(@album)
    else
      render :new
    end
  end
end
