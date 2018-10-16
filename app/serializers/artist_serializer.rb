class ArtistSerializer < ActiveModel::Serializer
  attributes :id, :name, :nationality, :bio
  has_many :artworks
  class ArtworksSerializer < ActiveModel::Serializer
    attributes :id, :title, :date
  end
end
