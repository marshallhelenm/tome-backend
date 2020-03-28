class WorldNoteSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :world
  has_many :images
end
