class Vote < ActiveRecord::Base
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  # setting up polymorphic association
  belongs_to :voteable, polymorphic: true

  validates_uniqueness_of :creator, scope: [:voteable_id, :voteable_type]
end