class ArtistsController < ApplicationController

    def index
        @artists = Artist.all
    end

    def show
        @artist = Artist.find(params[:id])
    end

    def create
        @artist = Artist.create(artist_params(:name, :bio))
        redirect_to artist_url(@artist)
    end

    def new
        @artist = Artist.new
    end

    def edit
        @artist = Artist.find(params[:id])
    end

    def update
        @artist = Artist.find(params[:id])
        @artist.update(artist_params(:name, :bio))
        redirect_to artist_url(@artist)
    end

    def destroy
    end

    private

    def artist_params(*args)
        params.require(:artist).permit(*args)
    end


end