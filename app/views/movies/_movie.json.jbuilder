json.extract! movie, :id, :title, :synopsis, :rent_price, :is_rented, :created_at, :updated_at
json.url movie_url(movie, format: :json)