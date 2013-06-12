class Post < ActiveRecord::Base
  attr_accessible :author_id, :title, :body

  belongs_to :author, class_name: "User"
  has_many :links, dependent: :destroy
  has_many :shares, class_name: "PostShare"

end
