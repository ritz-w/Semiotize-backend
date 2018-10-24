class ArtworkSerializer < ActiveModel::Serializer
  attributes :id, :title, :date, :image_url, :artist, :collection, :description
  has_many :artwork_motifs
  class ArtworkMotifSerializer < ActiveModel::Serializer
    attributes :id, :motif, :percent
  end
  
end
