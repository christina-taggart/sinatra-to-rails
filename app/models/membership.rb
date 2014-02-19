class Membership < ActiveRecord::Base
  attr_accessible :user_id, :wall_id
  belongs_to :user
  belongs_to :wall
end
