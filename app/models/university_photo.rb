class UniversityPhoto < ActiveRecord::Base
	belongs_to :university

	validates :photo, length: {maximum: 5.megabytes, message: "画像ファイルの最大サイズは5MBです。"}
	validates :content_type, presence: true, allow_blank: true,
		format: {with: /(image\/jpeg)|(image\/png)|(image\/gif)/,
			message: "アップロードできる画像の形式は、JPEG,PNG,GIFのいずれかです。"}
end
