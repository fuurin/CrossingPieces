class Article < ActiveRecord::Base
	belongs_to :user
	belongs_to :category
	belongs_to :university
	has_many :contents

	accepts_nested_attributes_for :contents, allow_destroy: true

	validates :user_id, presence: {message: "ログインした状態で記事を投稿してください。"}, 
		numericality: {only_integer: true, message: "不正なユーザIDです。"}
	validates :category_id, presence: {message: "記事のカテゴリーを選択してください。"}, 
		numericality: {only_integer: true, message: "不正なカテゴリーIDです。"}
	validates :university_id, presence: {message: "対応する大学を選択してください。"}, 
		numericality: {only_integer: true, message: "不正な大学IDです。"}
	validates :title, presence: {message: "タイトルを入力してください。"}
	validates :updated_at, presence: {message: "記事の日時を入力してください。"}
	validates :photo, 
		length: {maximum: 5.megabytes, message: "画像ファイルの最大サイズは5メガバイトです。"}
	validates :photo_content_type, 
		format: {with: /(image\/jpeg)|(image\/png)|(image\/gif)/,
		message: "アップロードできる画像の形式は、JPEG,PNG,GIFのいずれかです。"}, allow_blank: true
end
