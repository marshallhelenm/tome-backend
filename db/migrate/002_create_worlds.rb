class CreateWorlds < ActiveRecord::Migration[5.2]
  def change
    create_table :worlds do |t|
      t.string :name
      t.string :description
      t.integer :user_id
      t.integer :default_story_id


      t.timestamps
    end
  end
end
