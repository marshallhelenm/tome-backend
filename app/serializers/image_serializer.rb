class ImageSerializer < ActiveModel::Serializer
  attributes :id, :url, :world_id, :story_id, :character_id, :location_id, :story_note_id, :world_note_id
end
