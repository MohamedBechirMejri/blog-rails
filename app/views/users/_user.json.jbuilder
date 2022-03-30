json.extract! user, :id, :title, :picture_url, :bio, :created_at, :updated_at
json.url user_url(user, format: :json)
