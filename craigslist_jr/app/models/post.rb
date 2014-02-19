class Post < ActiveRecord::Base
  attr_accessible :title, :body, :price
  belongs_to :category
  before_create :generate_secret_url
  validates :title, :body, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0}

  def generate_secret_url
    secret = ( (0..9).to_a + ('a'..'z').to_a ).sample(5).join
    while Post.find_by_secret_url(secret)
      secret = ( (0..9).to_a + ('a'..'z').to_a ).sample(5).join
    end
    self.secret_url = secret
  end

end