json.array!(@users) do |user|
  json.extract! user, :city, :longitude, :latitude, :avatar
  json.url user_url(user, format: :json)
end
