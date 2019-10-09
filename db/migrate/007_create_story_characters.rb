class CreateStoryCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :story_characters do |t|
      t.integer :story_id
      t.integer :character_id

      t.timestamps
    end
  end
end
