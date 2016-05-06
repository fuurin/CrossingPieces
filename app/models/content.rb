class Content < ActiveRecord::Base
  belongs_to :article
  belongs_to :item

  validates :article_id, presence: {message: "記事を選択してください。"}, 
		numericality: {only_integer: true, message: "不正な記事IDです。"}
  validates :category_id, presence: {message: "カテゴリを選択してください。"}, 
		numericality: {only_integer: true, message: "不正なカテゴリIDです。"}
end
