json.array!(@posts) do |post|
  json.extract! post, :id, :content, :content_html, :user_id
  json.url post_url(post, format: :json)
end
