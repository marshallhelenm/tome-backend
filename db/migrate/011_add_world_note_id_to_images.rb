class AddWorldNoteIdToImages < ActiveRecord::Migration[5.2]
  def change
    add_column :images,  :world_note_id, :integer
  end
end
