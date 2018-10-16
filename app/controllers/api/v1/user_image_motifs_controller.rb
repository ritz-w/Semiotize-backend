class Api::V1::UserImageMotifsController < ApplicationController
    def index
        @user_image_motifs = UserImageMotif.all
        render json: @user_image_motifs
    end
end
