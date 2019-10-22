class StorySerializer < ActiveModel::Serializer
  attributes :id, :title, :description
  has_one :story_notes
  has_one :characters
  has_one :locations
  has_many :images
end
