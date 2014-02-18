class Url < ActiveRecord::Base
  before_save :generate_short_url
  validates :short_url, uniqueness: true
  belongs_to :user
  attr_accessible :long_url

  def generate_short_url
    self.short_url = "http://localhost:3000/" + short_key
  end

  def short_key
    (Faker::Lorem.word + rand(100).to_s).split('').shuffle.join
  end
end