class NotesController < ApplicationController
  def index
    @notes = Note.all
  end

  def show
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    @note.update_attributes(params[:note])
    if @note.save
      redirect_to note_url(@note)
    else
      render :edit
    end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(params[:note])
    if @note.save
      redirect_to track_url(@note.track)
    else
      render :edit
    end
  end

  def destroy
    @note = Note.find(params[:id])
    track = @note.track
    @note.destroy
    redirect_to track_url(track)
  end
end
