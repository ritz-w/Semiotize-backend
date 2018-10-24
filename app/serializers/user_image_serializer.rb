class UserImageSerializer < ActiveModel::Serializer
  attributes :id, :user_name, :user_location, :user_image_url, :image_title, :artworks, :created_at
  has_many :artworks
  class ArtworkSerializer < ActiveModel::Serializer
    attributes :id, :title, :image_url, :artist, :date, :collection, :artwork_motifs
    has_many :artwork_motifs
    class ArtworkMotifSerializer < ActiveModel::Serializer
      attributes :id, :artwork, :motif_id, :percent
    end
  end
  has_many :user_image_motifs
  class UserImageMotifSerializer < ActiveModel::Serializer
    attributes :id, :motif, :percent    
  end
end
