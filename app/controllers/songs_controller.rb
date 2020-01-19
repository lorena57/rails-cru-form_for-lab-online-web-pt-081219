class SongsController < ApplicationController

    def index
        @songs = Song.all
    end

    def show
        @song = Song.find(params[:id])
    end

    def create
        @song = Song.create(song_params(:name, :artist_id, :genre_id))
        redirect_to song_url(@song)
    end

    def new
        @song = Song.new
    end

    def edit
        @song = Song.find(params[:id])
    end

    def update
        @song = Song.update(song_params(:name, :artist_id, :genre_id))
        redirect_to song_url(@song)
    end

    def destroy
    end
    
    private

    def song_params(*args)
        params.require(:song).permit(*args)
    end


end