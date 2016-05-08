class Article < ActiveRecord::Base
	belongs_to :user
	belongs_to :category
	belongs_to :university
	has_many :contents

	accepts_nested_attributes_for :contents, allow_destroy: true

	validates :user_id, presence: {message: "ログインした状態で記事を投稿してください。"}, 
		numericality: {only_integer: true, 
			greater_than_or_equal_to: 0, message: "不正なユーザIDです。"}
	validates :category_id, presence: {message: "記事のカテゴリーを選択してください。"}, 
		numericality: {only_integer: true, 
			greater_than_or_equal_to: 0, message: "不正なカテゴリーIDです。"}
	validates :university_id, presence: {message: "対応する大学を選択してください。"}, 
		numericality: {only_integer: true, 
			greater_than_or_equal_to: 0, message: "不正な大学IDです。"}
	validates :title, presence: {message: "タイトルを入力してください。"}
	validates :created_at, presence: {message: "記事の作成日時を入力してください。"}
	validates :updated_at, presence: {message: "記事の更新日時を入力してください。"}
	validates :access, numericality: {only_integer: true, 
		greater_than_or_equal_to: 0, message: "不正なアクセス数です。"}
	validates :short_term_access, numericality: {only_integer: true, 
		greater_than_or_equal_to: 0, message: "不正な短期アクセス数です。"}
	validates :photo, 
		length: {maximum: 2.megabytes, message: "画像ファイルの最大サイズは2MBです。"}
	validates :photo_content_type, allow_blank: true,
		format: {with: /(image\/jpeg)|(image\/png)|(image\/gif)/,
		message: "アップロードできる画像の形式は、JPEG,PNG,GIFのいずれかです。"}
end
