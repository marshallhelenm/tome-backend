class StoryNoteSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :story
  has_many :images
end
