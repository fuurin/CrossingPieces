class UniversityPhoto < ActiveRecord::Base
	belongs_to :university

	# 画像のヴァリデーションってどうやるんだろう？
	validates :photo, presence: true
	validates :content_type, presence: true
end
