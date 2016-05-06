class Article < ActiveRecord::Base
  belongs_to :user
  belongs_to :university
  has_many :lecture_articles
  has_many :activity_articles
  has_many :shopping_articles

  accepts_nested_attributes_for :lecture_articles, allow_destroy: true
  accepts_nested_attributes_for :activity_articles, allow_destroy: true
  accepts_nested_attributes_for :shopping_articles, allow_destroy: true

  validates :user_id, presence: {message: "ログインした状態で記事を投稿してください。"}
  validates :university_id, presence: {message: "対応する大学を選択してください。"}
  validates :title, presence: {message: "タイトルを入力してください。"}
  validates :category, presence: {message: "記事のカテゴリーを選択してください。"},
    format: {with: /lecture|activity|shopping/, message: "未実装のカテゴリーです。"}
  validates :updated_at, presence: {message: "記事の日時を入力してください。"}
  validates :photo, 
    length: {maximum: 5.megabytes, message: "画像ファイルの最大サイズは5メガバイトです。"}
  validates :photo_content_type, 
    format: {with: /(image\/jpeg)|(image\/png)|(image\/gif)/,
    message: "アップロードできる画像の形式は、JPEG,PNG,GIFのいずれかです。"}, allow_blank: true
end
