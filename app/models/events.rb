
class Event < ActiveRecord::Base
    has_many :user_events
    has_many :users, through: :user_events
    validates :event_name, presence: true
    validates :desc, presence: true
    validates :start_time, presence: true
    validates :end_time, presence: true
    validates :location, presence: true
end