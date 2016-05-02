class University < ActiveRecord::Base
	belongs_to :users
	has_many :articles
	has_many :university_photos
	has_one :university_maps
	
	accepts_nested_attributes_for :university_photos, allow_destroy: true

	validates :name_ja, presence: {message: "日本語の大学名を入力してください。"},
											uniqueness: {message: "その日本語の大学名は既に存在します。"},
											format: {with: /.*[[ぁ-ん][ァ-ヴ][一-龠][亜-煕]]+.*/, 
												message: "日本語の大学名は、漢字、ひらがな、カタカナを含めて入力してください。"}

	validates :name_en, presence: {message: "英語の大学名を入力してください。"},
											uniqueness: {message: "その英語の大学名は既に存在します。"},
											format: {without: /.*[[ぁ-ん][ァ-ヴ][一-龠][亜-煕][「」。、]]+.*/, 
												message: "英語の大学名は、漢字、ひらがな、カタカナ等を含まないで入力してください。"}

	validates :recommended_point, presence: {message: "おすすめポイントを入力してください。"}
	validates :comment, presence: {message: "おすすめポイントの説明を入力してください。"}
	validates :created_by, presence: {message: "ログインした状態で大学を追加してください。"}
	validates :created_at, presence: {message: "大学を追加した時間を記録できませんでした。"}
	validates :updated_by, presence: {message: "ログインした状態で大学の情報を更新してください。"}
	validates :updated_at, presence: {message: "大学情報を更新した時間を記録できませんでした。"}
end
