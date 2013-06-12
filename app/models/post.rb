class Post < ActiveRecord::Base
  attr_accessible :author_id, :title, :body, :friend_circle_ids, :links_attributes 
  
  belongs_to :author, class_name: "User"
  has_many :links, dependent: :destroy
  has_many :shares, class_name: "PostShare"
  has_many :friend_circles, through: :shares
  
  accepts_nested_attributes_for :links, reject_if: :all_blank 
  
  validates :title, :body, :author_id, :presence => true

end
