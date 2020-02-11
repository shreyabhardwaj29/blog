class Article < ApplicationRecord
  has_many :articles
  validates_presence_of :title, :body, :category_id, :publish_date, :feature_image_url
  validates_uniqueness_of :title
  validates_length_of :title, :minimum => 5
  validates_length_of  :body, :maximum =>500
end

