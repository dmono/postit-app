class Category < ActiveRecord::Base
  # must be in this order
  has_many :post_categories
  has_many :posts, through: :post_categories

  validates :name, presence: true
end