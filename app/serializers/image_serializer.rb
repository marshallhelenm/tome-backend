class ImageSerializer < ActiveModel::Serializer
  attributes :id, :url, :world_id, :story_id, :character_id, :location_id, :note_id
end
