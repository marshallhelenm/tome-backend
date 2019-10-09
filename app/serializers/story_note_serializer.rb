class StoryNoteSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :story
end
