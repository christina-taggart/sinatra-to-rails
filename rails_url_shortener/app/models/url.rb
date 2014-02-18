class Url < ActiveRecord::Base
  attr_accessible :long_url, :short_url

  def shorten_url
    "localhost:3000/#{create_extension}"
  end

  def create_extension
    extension = ("A".."Z").to_a + (0..9).to_a + ("a".."z").to_a
    extension.sample(6).join("")
  end
end