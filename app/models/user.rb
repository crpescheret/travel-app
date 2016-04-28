class User < ActiveRecord::Base
  has_many :groups
  has_many :trips, through: :groups
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
