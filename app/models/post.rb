class Post < ActiveRecord::Base
  # if deviating from Rails convention, must specify the following
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
  # if using Rails convention
  # belongs_to :users
  has_many :comments
end