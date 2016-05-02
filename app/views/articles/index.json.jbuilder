json.array!(@articles) do |article|
  json.extract! article, :id, :user_id, :university_id, :title, :category, :updated_at
  json.url article_url(article, format: :json)
end
