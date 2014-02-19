class Url < ActiveRecord::Base
  attr_accessible :long_url, :short_url
  validates :long_url, :uniqueness => true
  before_create :create_extension, :fix_long_url

  def create_extension
    extension = ("A".."Z").to_a + (0..9).to_a + ("a".."z").to_a
    self.short_url = extension.sample(6).join("")
  end

  def fix_long_url
    unless /^(http:\/\/|https:\/\/)/.match(self.long_url)
      self.long_url = "http://#{self.long_url}"
    end
  end

end