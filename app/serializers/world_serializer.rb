class WorldSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :default_story_id, :stories
  has_one :stories
  has_one :characters
  has_one :locations
  has_many :images
  has_many :world_notes
end
