class Post < ActiveRecord::Base
  attr_accessible :author_id, :title, :body, :friend_circle_ids

  belongs_to :author, class_name: "User"
  has_many :links, dependent: :destroy
  has_many :shares, class_name: "PostShare"
  has_many :friend_circles, through: :shares

end
