class Artwork < ApplicationRecord
    belongs_to :artist
    has_many :artwork_motifs
    has_many :motifs, through: :artwork_motifs   
    has_and_belongs_to_many :user_images
end
