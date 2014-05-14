class Post < ActiveRecord::Base
has_many :comments
belongs_to :user
has_many :post_categories
has_many :categories, through: :post_categories
end