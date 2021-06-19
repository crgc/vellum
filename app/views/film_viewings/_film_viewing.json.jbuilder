json.extract! film_viewing, :id, :name, :rating, :user_id, :created_at, :updated_at
json.url film_viewing_url(film_viewing, format: :json)
