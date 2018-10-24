class ArtistSerializer < ActiveModel::Serializer
  attributes :id, :name, :nationality, :bio, :artworks
  has_many :artworks
  class ArtworksSerializer < ActiveModel::Serializer
    attributes :id, :title, :date, :artwork_motifs
    has_many :artwork_motifs
    class ArtworkMotifSerializer < ActiveModel::Serializer
      attributes :id, :motif, :percent
    end
  end
end
