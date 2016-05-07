class Item < ActiveRecord::Base
	belongs_to :category
	has_many :contents

	accepts_nested_attributes_for :contents, allow_destroy: true

	validates :category_id, presence: {message: "カテゴリを選択してください。"},
		numericality: {only_integer: true, 
			greater_than_or_equal_to: 0, message: "不正なカテゴリIDです。"}
	validates :order, numericality: {only_integer: true, 
		greater_than_or_equal_to: 0, message: "不正な順番の値です。"}
	validates :name, presence: {message: "項目名を入力してください。"}
	validates :mandatory, inclusion: {in: [true, false]}
end
