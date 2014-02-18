class Post < ActiveRecord::Base
  attr_accessible :link, :title, :description

  belongs_to :user
  has_many :comments
  has_many :votes
  validates_presence_of :link, :title
  validates_uniqueness_of :link
end
