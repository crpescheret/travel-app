class Trip < ActiveRecord::Base
  has_many :groups
  has_many :users, through: :groups
  belongs_to :user
  has_many :flights
  has_many :accommodations
  has_many :maps
  has_many :comments
  has_many :users, through: :comments

  def address 
    "#{city}, #{state}"
  end
end
