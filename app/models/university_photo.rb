class UniversityPhoto < ActiveRecord::Base
	belongs_to :university

	validates :university_id, presence: {message: "画像は大学と対応している必要があります。"},
		numericality: {only_integer: true, greater_than_or_equal_to: 0, 
			message: "不正な大学IDです。"}
	validates :photo, presence: {message: "不正な画像データです。"},
		length: {maximum: 1.megabytes, message: "画像ファイルの最大サイズは1MBです。"}
	validates :content_type, presence: true,
		format: {with: /(image\/jpeg)|(image\/png)|(image\/gif)/,
			message: "アップロードできる画像の形式は、JPEG,PNG,GIFのいずれかです。"}, allow_blank: true
end
