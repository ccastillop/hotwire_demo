json.extract! avatar, :id, :name, :image_url, :created_at, :updated_at
json.url avatar_url(avatar, format: :json)
