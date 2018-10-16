class Api::V1::ArtworksController < ApplicationController
    def index
         @artworks = Artwork.all
         render json: @artworks
     end
 end