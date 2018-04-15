
class Couple < ActiveRecord::Base
    has_many :regs
    belongs_to :user
end