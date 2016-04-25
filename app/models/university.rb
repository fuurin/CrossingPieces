class University < ActiveRecord::Base
	belongs_to :users
	has_many :university_photos
	has_one :university_map

	# DBの制約を、アプリケーション側でも、Modelの中でvalidatesとして行ってください。
	validates :name_en, presence: true, uniqueness: true
	validates :name_ja, presence: true, uniqueness: true
	validates :recommended_point, presence: true
	validates :comment, presence: true
	validates :created_by, presence: true
	validates :created_at, presence: true
	validates :updated_by, presence: true
	validates :updated_at, presence: true
end
