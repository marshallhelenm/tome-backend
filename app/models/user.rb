class User < ApplicationRecord
    has_many :worlds
    has_many :characters, through: :worlds
    has_many :stories, through: :worlds
    has_secure_password
    validates :username, uniqueness: {case_sensitive: false}
end
