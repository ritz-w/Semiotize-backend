class UserImageSerializer < ActiveModel::Serializer
  attributes :id, :user_name, :user_location, :user_image_url, :image_title, :artworks
  has_many :artworks
  class ArtworkSerializer < ActiveModel::Serializer
    attributes :id, :title, :image_url, :artist, :date
  end
end
