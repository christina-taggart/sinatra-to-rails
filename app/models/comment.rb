class Comment < ActiveRecord::Base
  attr_accessible :description

  belongs_to :user
  belongs_to :post
  validates_presence_of :description
end