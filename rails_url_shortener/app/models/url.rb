class Url < ActiveRecord::Base
  attr_accessible :long_url, :short_url
  validates :long_url, :uniqueness => true
  before_create :create_extension

  def create_extension
    extension = ("A".."Z").to_a + (0..9).to_a + ("a".."z").to_a
    self.short_url = extension.sample(6).join("")
  end
end