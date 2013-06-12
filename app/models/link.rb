class Link < ActiveRecord::Base
  attr_accessible :url, :post_id

  belongs_to :post
end
