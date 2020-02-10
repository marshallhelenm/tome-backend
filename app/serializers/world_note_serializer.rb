class WorldNoteSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :world_id
end
