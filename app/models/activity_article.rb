class ActivityArticle < ActiveRecord::Base
  belongs_to :article

  validates :article_id, presence: {message: "記事のIDが内容と対応していません。"}
  validates :name , presence: {message: "「アクティビティ名」を入力してください。"}
  validates :period, presence: {message: "「日時」を入力してください。"}
  validates :expense, presence: {message: "「費用」を入力してください。"}
  validates :place, presence: {message: "「場所」を入力してください。"}
  validates :content, presence: {message: "「内容」を入力してください。"}
  validates :impression, presence: {message: "「感想」を入力してください。"}
end
