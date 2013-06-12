class FriendCircleMembership < ActiveRecord::Base
  attr_accessible :circle_id, :member_id

  belongs_to :member, class_name: 'User'
  belongs_to :circle, class_name: 'FriendCircle'
end
