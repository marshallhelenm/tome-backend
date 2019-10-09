class Location < ApplicationRecord
  belongs_to :world
  has_many :story_locations
end
