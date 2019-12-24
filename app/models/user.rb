class User < ApplicationRecord
    has_many :connections
    has_many :groups, through: :connections
    has_many :posts
end