class ChangeDateInArtworks < ActiveRecord::Migration[5.2]
  def change
    remove_column :artworks, :date
    add_column :artworks, :date, :integer
  end
end
