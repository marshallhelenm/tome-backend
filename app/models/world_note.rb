class WorldNote < ApplicationRecord
    belongs_to :world
    has_many :images
end
