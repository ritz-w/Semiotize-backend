class CreateArtworks < ActiveRecord::Migration[5.2]
  def change
    create_table :artworks do |t|
      t.string :title
      t.datetime :date
      t.string :image_url
      t.integer :artist_id
      t.text :description

      t.timestamps
    end
  end
end
