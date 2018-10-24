class CollectionSerializer < ActiveModel::Serializer
    attributes :id, :name, :nationality, :bio, :artworks
    class ArtworksSerializer < ActiveModel::Serializer
        attributes :id, :title, :date, :image_url
    end
  end
  