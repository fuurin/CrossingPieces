class LectureArticle < ActiveRecord::Base
  belongs_to :article

  validates :article_id, presence: {message: "記事のIDが内容と対応していません。"}
  validates :name , presence: {message: "「授業名」を入力してください。"}
  validates :credit, presence: {message: "「単位数」を入力してください。"}
  validates :department, presence: {message: "「学部」を入力してください。"}
  validates :period, presence: {message: "「受講時期」を入力してください。"}
  validates :homework, presence: {message: "「課題」を入力してください。"}
  validates :impression, presence: {message: "「感想」を入力してください。"}
  validates :recommended_for, presence: {message: "「こんな人におすすめ」を入力してください。"}
end
