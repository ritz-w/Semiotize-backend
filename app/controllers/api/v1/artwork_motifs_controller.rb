class Api::V1::ArtworkMotifsController < ApplicationController
    def index
        @artwork_motifs = ArtworkMotif.all
        render json: @artwork_motifs
    end
end
