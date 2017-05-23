class Songs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.integer :user_id
      t.string :title
      t.string :singer
      t.string :artist
      t.string :pic
      t.string :file
      t.text :description
      t.integer :comments_count, default: 0

      t.timestamps
    end
     # add_index :songs, [:user_id, :created_at]
  end
end