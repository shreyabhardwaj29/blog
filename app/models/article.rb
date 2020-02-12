class Article < ApplicationRecord
  belongs_to :category
  validates_presence_of :title, :body, :category_id, :publish_date, :feature_image_url
  validates_uniqueness_of :title
  validates_length_of :title, :minimum => 5
  validates_length_of  :body, :maximum =>500
  mount_uploader :feature_image_url, FeatureImageUrlUploader

  # def is_published?
  #   if publish_date > 1.month.from_now
  #     errors.add(:publish_date,"date greater than a month")
  #   end
  # end

end

