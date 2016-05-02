class Article < ActiveRecord::Base
  belongs_to :user
  belongs_to :university
  has_many :lecture_articles
  has_many :activity_articles
  has_many :shopping_articles
end
