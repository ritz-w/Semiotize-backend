class Api::V1::MotifsController < ApplicationController
    def index
        @motifs = Motif.all
        render json: @motifs
    end
end
