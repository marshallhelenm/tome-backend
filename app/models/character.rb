class Character < ApplicationRecord
  belongs_to :world
  has_many :story_characters
end
