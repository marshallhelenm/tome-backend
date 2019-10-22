class Location < ApplicationRecord
  belongs_to :world
  has_many :story_locations
  has_many :images
end
