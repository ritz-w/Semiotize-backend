class ArtworkSerializer < ActiveModel::Serializer
  attributes :id, :title, :date, :image_url, :artist, :collection, :description
end
