class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title
      t.boolean :recorded_live, :default => 0
      
      t.timestamps
    end
  end
end
