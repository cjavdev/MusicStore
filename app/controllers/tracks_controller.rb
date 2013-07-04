class TracksController < ApplicationController

  before_filter :authenticate
  before_filter :authorize, :only => :destroy

  def index
    @tracks = Track.all
  end

  def show
    @track = Track.find(params[:id])
    @note = Note.new
  end

  def new
    @track = Track.new
  end

  def edit
    @track = Track.find(params[:id])
  end

  def update
    @track = Track.find(params[:id])
    @track.update_attributes(params[:track])
    if @track.save
      redirect_to track_url(@track)
    else
      render :edit
    end
  end

  def destroy
    @track = Track.find(params[:id]).destroy
    redirect_to tracks_url
  end

  def create
    @track = Track.new(params[:track])

    if @track.save
      redirect_to track_url(@track)
    else
      render :edit
    end
  end
end
