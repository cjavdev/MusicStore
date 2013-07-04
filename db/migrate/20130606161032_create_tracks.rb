class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :title
      t.integer :song_id
      t.integer :album_id
      t.boolean :is_bonus, :default => 0
      t.text :lyrics

      t.timestamps
    end
  end
end
