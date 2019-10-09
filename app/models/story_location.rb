class StoryLocation < ApplicationRecord
    belongs_to :location
    belongs_to :story
end
