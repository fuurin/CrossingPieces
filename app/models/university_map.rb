class UniversityMap < ActiveRecord::Base
  belongs_to :university

	validates :university_id, presence: {message: "地図データは大学と対応している必要があります。"},
		numericality: {only_integer: true, greater_than_or_equal_to: 0, 
			message: "不正な大学IDです。"}
  
  validates :lat, presence: {message: "地図の緯度が不正な値だったため、地図データは保存されませんでした。"},
  	numericality: {greater_than_or_equal_to: -90.0, less_than_or_equal_to: 90.0, 
  		message: "地図の緯度が不正な値だったため、地図データは保存されませんでした。"}

	validates :lng, presence: {message: "地図の経度が不正な値だったため、地図データは保存されませんでした。"},
		numericality: {greater_than_or_equal_to: -180.0, less_than_or_equal_to: 180.0,
			message: "地図の経度が不正な値だったため、地図データは保存されませんでした。"}

	validates :zoom, presence: {message: "地図の拡大度が不正な値だったため、地図データは保存されませんでした。"},
		numericality: {only_integer: true, greater_than_or_equal_to: 0,
			message: "地図の拡大度が不正な値だったため、地図データは保存されませんでした。"}
end
