class User < ApplicationRecord
  has_many :articles
  has_many :roles, through: :permissions
  has_many :permissions
  validates_presence_of :username, :mobile, :gender, :dob, :email, :password
  validates_uniqueness_of :username, :mobile
  validates_length_of :username, :minimum => 5
  validates_length_of  :mobile, :maximum =>10
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
