class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :name, :email, :password

  validates_presence_of :name, :email
  validates_uniqueness_of :email
  validates :email, :email_format => {:message => 'is not valid'}

  has_many :posts
  has_many :comments
  has_many :votes
  has_many :walls, through: :memberships
  has_many :memberships

  # before_validation :encrypt_password

  # def self.authenticate(email, password)
  #   @user = User.where(email: email.downcase).first
  #   if @user && BCrypt::Password.new(@user.password_hash) == password
  #     return @user
  #   end
  #   false
  # end

  # private
  # def encrypt_password
  #   if self.password_hash.nil?
  #     return nil
  #   else
  #     self.password_hash = BCrypt::Password.create(self.password_hash)
  #   end
  # end
end