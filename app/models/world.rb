class World < ApplicationRecord
  belongs_to :user
  has_many :characters
  has_many :locations
  has_many :stories
  
end
