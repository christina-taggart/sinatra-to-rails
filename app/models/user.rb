require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  attr_accessible :name, :email, :password_hash

  validates_presence_of :name, :email, :password_hash
  validates_uniqueness_of :email
  validates :email, :email_format => {:message => 'is not valid'}

  has_many :posts
  has_many :comments
  has_many :votes

  before_validation :encrypt_password

  def authenticate_user(password)
    BCrypt::Password.new(self.password_hash) == password
  end

  private
  def encrypt_password
    self.password_hash = BCrypt::Password.create(self.password_hash)
  end
end