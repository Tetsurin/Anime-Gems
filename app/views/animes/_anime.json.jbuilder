json.extract! anime, :id, :name, :original_name, :description, :poster, :release_date, :type, :episode_number, :studio, :director, :logo, :horizontal_poster, :created_at, :updated_at
json.url anime_url(anime, format: :json)
