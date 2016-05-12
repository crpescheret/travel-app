class User < ActiveRecord::Base
  has_many :groups
  has_many :comments
  has_many :trips, through: :comments
  has_many :trips, through: :groups
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
