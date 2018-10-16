class UserImage < ApplicationRecord
    has_many :user_image_motifs
    has_many :motifs, through: :user_image_motifs
    has_and_belongs_to_many :artworks
end
