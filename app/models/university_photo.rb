class UniversityPhoto < ActiveRecord::Base
	belongs_to :university

	validates :photo, presence: {message: "不正な画像データです。"},
		length: {maximum: 5.megabytes, message: "画像ファイルの最大サイズは5メガバイトです。"}
	validates :content_type, presence: true,
		format: {with: /(image\/jpeg)|(image\/png)|(image\/gif)/,
			message: "アップロードできる画像の形式は、JPEG,PNG,GIFのいずれかです。"}, allow_blank: true
end
