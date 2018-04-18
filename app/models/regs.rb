
class Reg < ActiveRecord::Base
    belongs_to :couple
    validates :item_name, presence: true
    validates :item_link, presence: true
end