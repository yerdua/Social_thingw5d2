class FriendCircle < ActiveRecord::Base
  attr_accessible :owner_id, :name, :member_ids

  belongs_to :owner, class_name: 'User'
  has_many :memberships,
           class_name: 'FriendCircleMemberships',
           foreign_key: :circle_id,
           dependent: :destroy

  has_many :members, through: :memberships


end
