class Api::V1::ArtistsController < ApplicationController
   def index
        @artists = Artist.all
        render json: @artists
    end

    def show
        @artist = Artist.find(params[:id])
        render json: @artist
    end

    def sfmoma
        @artists = []
        Artist.all.each do |artist|
            artist.artworks.first.collection == "San Francisco Museum of Modern Art" ? @artists << artist : nil
        end
        render json: @artists
    end

end
