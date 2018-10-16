class CreateArtworkMotifs < ActiveRecord::Migration[5.2]
  def change
    create_table :artwork_motifs do |t|
      t.integer :artwork_id
      t.integer :motif_id
      t.integer :percent

      t.timestamps
    end
  end
end
