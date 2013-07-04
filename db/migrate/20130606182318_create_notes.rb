class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :user_id
      t.text :body
      t.integer :track_id

      t.timestamps
    end
  end
end
