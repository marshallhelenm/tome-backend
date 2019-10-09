class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password, :default_world_id, :worlds
end
