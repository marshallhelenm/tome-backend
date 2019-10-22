class World < ApplicationRecord
  belongs_to :user
  has_many :characters
  has_many :locations
  has_many :stories
  
  mount_uploader :image, ImageUploader
  has_attachments :photos, maximum: 10
end
