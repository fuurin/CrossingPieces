class UniversityMap < ActiveRecord::Base
  belongs_to :university

  validates :lat, presence: true
	validates :lng, presence: true
end
