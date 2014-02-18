class Url < ActiveRecord::Base
  attr_accessible :original_url
  validates :url_digest, uniqueness: true
  after_initialize :after_initialize
  validates :original_url, :format => { :with => /.+\...+/ }

  def after_initialize
    self.visit_count ||= 0
  end
end