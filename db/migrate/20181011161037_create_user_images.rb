class CreateUserImages < ActiveRecord::Migration[5.2]
  def change
    create_table :user_images do |t|
      t.string :user_name
      t.string :user_location
      t.string :user_image_url

      t.timestamps
    end
  end
end
