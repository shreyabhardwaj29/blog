class Category < ApplicationRecord
  #extend FriendlyId
  #friendly_id :name, use: :slugged
  has_many :articles, dependent: :destroy
  
  validates_presence_of :name, :description
  validates_uniqueness_of :name
  validates_length_of :name, :minimum => 5
  validates_length_of :description, :maximum =>500
end
