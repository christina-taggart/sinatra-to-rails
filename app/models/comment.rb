class Comment < ActiveRecord::Base
  attr_accessible :description, :user_id, :post_id

  belongs_to :user
  belongs_to :post
  validates_presence_of :description
end