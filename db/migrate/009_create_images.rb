class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :url
      t.integer :world_id
      t.integer :story_id
      t.integer :character_id
      t.integer :location_id
      t.integer :note_id

      t.timestamps
    end
  end
end
