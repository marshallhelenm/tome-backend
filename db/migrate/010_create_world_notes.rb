class CreateWorldNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :world_notes do |t|
      t.string :title
      t.string :content
      t.integer :world_id

      t.timestamps
    end
  end
end
