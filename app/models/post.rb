class Post < ActiveRecord::Base
  attr_accessible :body, :category_id, :edit_key, :title
  belongs_to :category
end
