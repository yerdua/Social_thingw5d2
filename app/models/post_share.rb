class PostShare < ActiveRecord::Base
  attr_accessible :post_id, :friend_circle_id

  belongs_to :post
  belongs_to :friend_circle
end
