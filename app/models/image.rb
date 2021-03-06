class Image < ApplicationRecord
    belongs_to :world_note, :foreign_key => "world_note_id", optional: true
    belongs_to :story_note, :foreign_key => "story_note_id", optional: true 
    belongs_to :world, :foreign_key => "world_id", optional: true 
    belongs_to :story, :foreign_key => "story_id", optional: true 
    belongs_to :character, :foreign_key => "character_id", optional: true 
    belongs_to :location, :foreign_key => "location_id", optional: true 

end
