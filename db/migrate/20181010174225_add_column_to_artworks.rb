class AddColumnToArtworks < ActiveRecord::Migration[5.2]
  def change
    add_column :artworks, :collection, :string
  end
end
