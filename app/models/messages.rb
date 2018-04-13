require './config/environment'

class Message < ActiveRecord::Base
    belongs_to :user
end