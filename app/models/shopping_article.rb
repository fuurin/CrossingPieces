class ShoppingArticle < ActiveRecord::Base
  belongs_to :article

  validates :article_id, presence: {message: "記事のIDが内容と対応していません。"}
  validates :name , presence: {message: "「店名」を入力してください。"}
  validates :merchandise, presence: {message: "「商品」を入力してください。"}
  validates :comment, presence: {message: "「コメント」を入力してください。"}
end
