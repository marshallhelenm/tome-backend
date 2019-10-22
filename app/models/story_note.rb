class StoryNote < ApplicationRecord
    belongs_to :story
    has_many :images
end
