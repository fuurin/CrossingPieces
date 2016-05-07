class Content < ActiveRecord::Base
  belongs_to :article
  belongs_to :item

  validates :article_id, presence: {message: "記事を選択してください。"}, 
		numericality: {only_integer: true, 
			greater_than_or_equal_to: 0, message: "不正な記事IDです。"}
			
  validates :item_id, presence: {message: "項目を選択してください。"}, 
		numericality: {only_integer: true, 
			greater_than_or_equal_to: 0, message: "不正な項目IDです。"}
end
