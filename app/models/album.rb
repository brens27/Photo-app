class Album < ActiveRecord::Base
  # Remember to create a migration!
  validates :title, uniqueness: true
  validates :title, presence: true

  has_many :photos
end
