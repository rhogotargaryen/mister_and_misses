
class User < ActiveRecord::Base
    has_secure_password
    validates :username, presence: true
    validates :name, presence: true
    validates :email, presence: true
    validates :password, presence: true
    has_many :user_events
    has_many :events, through: :user_events
    has_many :posts
    has_one :couple
end