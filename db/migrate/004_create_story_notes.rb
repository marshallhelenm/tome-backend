class CreateStoryNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :story_notes do |t|
      t.string :title
      t.string :content
      t.integer :story_id

      t.timestamps
    end
  end
end
