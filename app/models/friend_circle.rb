class FriendCircle < ActiveRecord::Base
  attr_accessible :owner_id, :name, :member_ids

  belongs_to :owner, class_name: 'User'
  has_many :memberships,
           class_name: 'FriendCircleMembership',
           foreign_key: :circle_id,
           dependent: :destroy

  has_many :members, through: :memberships
  has_many :post_shares
  has_many :posts, through: :post_shares

end
