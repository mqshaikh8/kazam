class User < ApplicationRecord
    has_many :connections
    has_many :groups, through: :connections
    has_many :posts

    has_many :followed_users, foreign_key: :follower_id, class_name: 'Follow'
    has_many :followees, through: :followed_users
    
    has_many :following_users, foreign_key: :followee_id, class_name: 'Follow'
    has_many :followers, through: :following_users


    validates :username, uniqueness: true
    validates :name, presence: true
end