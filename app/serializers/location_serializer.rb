class LocationSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :world
  has_many :images
end
