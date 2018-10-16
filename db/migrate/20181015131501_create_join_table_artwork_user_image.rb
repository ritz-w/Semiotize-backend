class CreateJoinTableArtworkUserImage < ActiveRecord::Migration[5.2]
  def change
    create_join_table :artworks, :user_images do |t|
      t.index [:artwork_id, :user_image_id]
      # t.index [:user_image_id, :artwork_id]
    end
  end
end
