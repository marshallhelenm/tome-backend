class Story < ApplicationRecord
  belongs_to :world
  has_many :story_notes
  has_many :story_characters
  has_many :story_locations
  has_many :characters, through: :story_characters
  has_many :locations, through: :story_locations
  has_many :images
end
