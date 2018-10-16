class CreateUserImageMotifs < ActiveRecord::Migration[5.2]
  def change
    create_table :user_image_motifs do |t|
      t.integer :user_image_id
      t.integer :motif_id
      t.float :percent

      t.timestamps
    end
  end
end
