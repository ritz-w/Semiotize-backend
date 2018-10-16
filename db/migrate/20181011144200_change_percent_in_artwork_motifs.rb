class ChangePercentInArtworkMotifs < ActiveRecord::Migration[5.2]
  def change
    change_column :artwork_motifs, :percent, :float
  end
end
