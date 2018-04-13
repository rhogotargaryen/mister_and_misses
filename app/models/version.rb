module MisterAndMisses
  VERSION = "0.1.0"
end


#  User
 # has one message
 # has many events through event_user_id
 #  __ 
 #
 # name, email, password_digest


#  Messages (for Guestbook)
  # belongs to User
  #
  # __
  #
  #  has content

#  Events
  # has many users through event_user_id
  # 
  # __
  #
  # location, time_start, time_end, 
  
#  EventUserID
    # belongs to Event
    # belongsto User
    #
    # __
    # 
    # event_id, user_id
  