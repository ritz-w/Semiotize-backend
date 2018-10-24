class Api::V1::CollectionsController < ApplicationController
 
     def sfmoma
         @artists = []
         Artist.all.each do |artist|
             artist.artworks.first.collection == "San Francisco Museum of Modern Art" ? @artists << artist : nil
         end
         render json: @artists, each_serializer: CollectionSerializer
     end

     def kiasma
        @artists = []
        Artist.all.each do |artist|
            artist.artworks.first.collection == "Kiasma, Finnish National Gallery" ? @artists << artist : nil
        end
        render json: @artists, each_serializer: CollectionSerializer
    end

    def harvard
        @artists = []
        Artist.all.each do |artist|
            artist.artworks.first.collection.include?("Harvard Art Museums") ? @artists << artist : nil
        end
        render json: @artists, each_serializer: CollectionSerializer
    end

    def rmngp
        @artists = []
        Artist.all.each do |artist|
            !artist.artworks.first.collection.include?("Harvard Art Museums") && 
            artist.artworks.first.collection != "Kiasma, Finnish National Gallery" &&
            artist.artworks.first.collection != "San Francisco Museum of Modern Art" ? 
            @artists << artist : nil
        end
        render json: @artists, each_serializer: CollectionSerializer
    end
 
 end
 