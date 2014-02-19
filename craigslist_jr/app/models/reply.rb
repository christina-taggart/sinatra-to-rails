class Reply < ActiveRecord::Base
  attr_accessible :name, :email, :text
  validates :name, :email, :text, presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  belongs_to :post
end