class Group < ApplicationRecord
    has_many :connections
    has_many :users, through: :connections
    has_many :posts
end