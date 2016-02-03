json.array!(@users) do |user|
  json.extract! user, :city, :longitude, :latitude
  json.url user_url(user, format: :json)
end
