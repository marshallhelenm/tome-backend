class World < ApplicationRecord
  belongs_to :user
  has_many :world_notes
  has_many :characters
  has_many :locations
  has_many :stories
  has_many :images
end
