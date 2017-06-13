class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def update
    @song = Song.find(params[:id])
    if @song.update(song_params)
      redirect_to @song
    else
    render :edit
  end
end

  def edit
		@song = Song.find(params[:id])
	end

  def destroy
    @song = Song.find(params[:id])
    if @song.delete
      redirect_to @song
    else
      render :new
    end 
  end

private

  def song_params
    params.require(:song).permit(:title, :artist_name, :release_year, :released, :genre)
  end

end
