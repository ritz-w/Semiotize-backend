class Motif < ApplicationRecord
    has_many :artwork_motifs
    has_many :user_image_motifs
    has_many :artworks, through: :artwork_motifs
    has_many :user_images, through: :user_image_motifs
end
