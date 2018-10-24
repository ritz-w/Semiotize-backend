class Api::V1::UserImagesController < ApplicationController
    def index
        @all_images = UserImage.all
        render json: @all_images
    end

    def show
        @user_image = UserImage.find(params[:id])
        render json: @user_image
    end

    def three
        @user_images = UserImage.last(4)
        render json: @user_images
    end
    
    def upload
        @user_image = UserImage.create(user_name: params[:user_name], user_location: params[:user_location], image_title: params[:image_title], user_image_url: params[:image_url])
        generated_motifs = Clarifai::Rails::Detector.new(@user_image.user_image_url).image.concepts_with_percent
        motif_names = generated_motifs.keys

        motif_names.each do |motif|
            located_motif = Motif.find_or_create_by(name: motif)
            UserImageMotif.create(user_image_id: @user_image.id, motif_id: located_motif.id, percent: generated_motifs[motif])
        end

        matching_artworks = []
        @user_image.motifs.each do |motif|
            matching_artworks.concat(motif.artworks)
        end
        matching_artworks_id = matching_artworks.group_by {|artwork| artwork.id}.to_a.sort_by {|x| -x[1].length}[0..9].map{|am| am[0]}
        found_artworks = matching_artworks_id.map {|id| Artwork.all.find(id)}
        found_artworks.each do |artwork|
            @user_image.artworks << artwork
        end
        render json: @user_image
    end
end
