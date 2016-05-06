class Category < ActiveRecord::Base
	has_many :articles
	has_many :items

	accepts_nested_attributes_for :articles, allow_destroy: true
	accepts_nested_attributes_for :items, allow_destroy: true

	validates :en, 	presence: {message: "英語のカテゴリ名を入力してください。"},
									uniqueness: {message: "その英語のカテゴリ名は既に存在します。"},
									format: {without: /.*[[ぁ-ん][ァ-ヴ][一-龠][亜-煕][「」。、]]+.*/, 
									message: "英語のカテゴリ名は、漢字、ひらがな、カタカナ等の全角文字を含まないで入力してください。"}

	validates :ja,	presence: {message: "日本語のカテゴリ名を入力してください。"},
									uniqueness: {message: "その日本語のカテゴリ名は既に存在します。"},
									format: {with: /.*[[ぁ-ん][ァ-ヴ][一-龠][亜-煕]]+.*/, 
									message: "日本語のカテゴリ名は、漢字、ひらがな、カタカナのいずれかを含めて入力してください。"}
end
