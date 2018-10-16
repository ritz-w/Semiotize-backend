class AddColumnToUserImages < ActiveRecord::Migration[5.2]
  def change
    add_column :user_images, :image_title, :string
  end
end
