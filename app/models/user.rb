class User < ApplicationRecord
  has_many :articles
  has_many :roles, through: :permissions
  has_many :permissions
  has_many :comments
  


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
